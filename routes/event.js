/*
 Create new event
 */

"use strict";

var express = require('express');
var multer = require('multer');
var fs = require('fs');
var path = require('path');
var favicon = require('serve-favicon');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var q = require('q');
//var promisify = require('deferred').promisify;

var router = express.Router();
module.exports = router;

router.get('/', function (req, res, next) {
    sendEventCreateHtml(req, res);
});


function sendEventCreateHtml(req, res) {
    res.sendFile(path.resolve(__dirname + '/../views/event.html'));
}


router.post('/newevent', function (req, res) {
    logger.log("GET /newevent");
    logger.log(req.body.uploadedFiles);

    db.connection.query("INSERT INTO event (NAME,DT,REGSTART,REGEND,INFO,PRICE,CURRENCY,MINMEMBERS,MAXMEMBERS) VALUES (?,?,?,?,?,?,?,?,?)", [[req.body.eventname], new Date([req.body.eventdate]), new Date([req.body.regstart]), new Date([req.body.regend]), [req.body.info], [req.body.price], [req.body.currency], [req.body.minmembers], [req.body.maxmembers]])
        .on('result', function (row) {
            logger.log("Row inserted to events  id=" + row.insertId);
            var dirPath = './uploads/' + req.body.eventRandomHash + '/';
            fs.readdir(dirPath, function (err, files) {
                if (!err) {
                    for (var i = 0; i < files.length; i++) {
                        uploadImgToDb(dirPath + files[i], row.insertId);
                    }
                }
                else {
                    logger.log('Error loading files to db');
                    logger.log(err);
                }
            });

            //res.set("Content-Type", "text/plain");
            var response = {
                eventId: row.insertId,
                host: req.protocol + '://' + req.get('host'),
                redirect: req.protocol + '://' + req.get('host') + '/invite?id=' + row.insertId
            };
            res.send(response);
        })
        .on('error', function (err) {
            logger.log("Error while inserting into event");
            logger.log(err);
        });
});


router.post('/file-upload', function (req, res) {
    logger.log('POST /file-upload');
    var eventRandomHash = req.query.hash;
    var uploadPath = './uploads/' + eventRandomHash + '/';

    tools.checkCreateDir(uploadPath)
        .then(function (msg) {
            var storage = multer.diskStorage({
                destination: function (request, file, callback) {
                    callback(null, uploadPath);
                },
                filename: function (request, file, callback) {
                    logger.log(file);
                    callback(null, file.originalname)
                }
            });
            var upload = multer({storage: storage}).array('file', 5);

            upload(req, res, function (err) {
                if (err) {
                    logger.log('Error Occured' + err);
                    logger.log(err.stack);
                    return;
                }
                logger.log(req.files);
                res.end('Your Files Uploaded');
                logger.log('Images uploaded');
            })
        })
        .catch(function (err) {
            res.end('Failed to upload file');
        });
});

router.get('/image', function (req, res) {
    // ?id=XXX&img=XXXXX
    logger.log('GET /image');
    var eventId = req.query.id;
    var imageName = req.query.img;
    logger.log("eventId=" + eventId + "  imageName=" + imageName);

    if (!eventId || !imageName) {
        res.end('');
        return;
    }
    db.connection.query("SELECT img FROM eventimg WHERE eventid=? and name=?", [eventId, imageName])
        .on('result', function (row) {
            logger.log("Image retrieved:  eventId=" + eventId + "  name=" + imageName);
            var imageExt = tools.getFileExt(imageName);
            res.writeHead(200, {'Content-Type': 'image/' + imageExt});
            res.write(row.img);
            res.end();
        })
        .on('error', function (err) {
            logger.log("Error while retrieving image:  eventId=" + eventId + "  name=" + imageName);
            logger.log(err);
            res.send('');
        });
});


function uploadImgToDb(path, eventId) {
    var deferred = q.defer();
    var fileName = path.replace(/^.*[\\\/]/, '');
    tools.getFilesize(path)
        .then(function (fileSize) {
            fs.open(path, 'r', function (status, fd) {
                logger.log("File opened");
                if (status) {
                    console.log(status.message);
                    return;
                }
                var buffer = new Buffer(fileSize);
                fs.read(fd, buffer, 0, fileSize, 0, function (err, num) {
                    db.connection.query("INSERT INTO eventimg (EVENTID, NAME, IMG) VALUES (?,?,?)", [eventId, fileName, buffer])
                        .on('result', function (row) {
                            deferred.resolve();
                        })
                        .on('error', function (err) {
                            logger.log("Error while inserting into eventimg");
                            logger.log(err);
                            deferred.reject(err);
                        });

                });
            });
        })
    return deferred.promise;
}


router.get('/memberslist', function (req, res) {
    // ?id=XXX
    logger.log('GET /memberslist');


    var eventId = req.query.id;

    if (!eventId) {
        logger.log("ID is not specified")
        res.send("ID is not specified. Use /memberslist?id=XXX where XXX is the event ID");
        return;
    }

    var conn;
    db.getConnection()
        .then((connection) => {
            conn=connection;
            return getSqlForDataRetrive(conn, eventId);
        })
        .then((sqltext) => {
            return getMemebersListData(conn, eventId, sqltext);
        })
        .then((rows) => {
            var result = {
                eventId: eventId,
                memberslist: rows
            };
            //logger.log(result.memberslist[0]);
            res.render('memberslist', result);
        })
        .catch((err)=> {
            logger.log("Error accuired while retriving data from database");
            logger.log(err);
            res.send("Error accuired while retriving data from database");
        })
})


function getSqlForDataRetrive(conn, eventId) {
    var deferred = q.defer();
    conn.query("SELECT pivotsql FROM v_pivotdata WHERE eventid=?", [eventId], function (err, result) {
        if (err) {
            console.log(err);
            deferred.reject(err);
            return;
        }
        //logger.log("Pivot sql: ");
        //logger.log(result[0].pivotsql);
        deferred.resolve(result[0].pivotsql);
    })
    return deferred.promise;
}


function getMemebersListData(conn, eventId, sqltext) {
    var deferred = q.defer();

    var rows = [];
    conn.query(sqltext, [eventId], (err,result)=>{
        if (err){
            logger.log(err);
            deferred.reject(err);
            return;
        }
        deferred.resolve(result);
    })

    return deferred.promise;
}

