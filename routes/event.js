/*
 Create new event
 */

"use strict";

var express = require('express');
var multer = require('multer');
var fs = require('fs');
var path = require('path');
var favicon = require('serve-favicon');
var q = require('q');
var rmdir = require('rmdir');
var auth = require('../auth');


var router = express.Router();
module.exports = router;

const queryInsertEventData = "INSERT INTO event (USRID,NAME,DT,REGSTART,REGEND,INFO,PRICE,CURRENCY,MINMEMBERS,MAXMEMBERS) VALUES (?,?,?,?,?,?,?,?,?,?)";
const querySelectEventImg = "SELECT img FROM eventimg WHERE eventid=? and name=?";


router.get('/', auth.checkAuth, function (req, res, next) {

    if (!req.query.id) {
        // event create request
        res.render('event', '');
        //res.sendFile(path.resolve(__dirname + '/../views/event.html'));
    }
    else{
        // event update request
        db.getEventData(req.query.id)
            .then((result) => {
                res.render('event', result);
            })
            .catch((err) => {
                logger.log(err);
                res.send(err);
            })
    }
    
});



router.post('/newevent', auth.checkAuth, function (req, res) {
    logger.log("POST /newevent");
    //logger.log(req.body);

    logger.log('req.userId='+req.userId);

    insertEvent(req.userId,req.body)
        .then((newEventId)=> {
            logger.log("insertEvent done.  newEventId="+newEventId);
            var responsedata = {
                eventId: newEventId,
                host: req.protocol + '://' + req.get('host'),
                redirect: req.protocol + '://' + req.get('host') + '/invite?id=' + newEventId
            };
            res.send(responsedata);
        })
        .catch((err) => {
            var responsedata = {
                err: err,
            };
            res.send(responsedata);
            return;
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
    db.connection.query(querySelectEventImg, [eventId, imageName])
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

//-----------------------------------------------------------------------------------------------------------------
function insertEvent(userId,eventData) {
    var deferred = q.defer();
    var conn;
    var eventId;
    db.getConnection()
        .then((dbconnect) => {
            conn = dbconnect;
            return db.beginTransaction(conn);
        })
        .then(()=> {
            logger.log('db_insertEvent');
            return db_insertEvent(conn, userId,eventData)
        })
        .then((newEventId)=> {
            eventId = newEventId;
            logger.log('db_insertEventFields');
            return db_insertEventFields(conn, eventId, eventData.customFields);
        })
        .then(() => {
            logger.log('db_moveImagesToDb');
            var imagesArray = JSON.parse(eventData.uploadedFilesArray);
            var dirPath = './uploads/' + eventData.eventRandomHash;
            return db_moveImagesToDb(conn, eventId, dirPath + '/', imagesArray);
        })
        .then(()=> {
            logger.log('commit');
            return db.commitTransaction(conn);
        })
        .then(()=> {
            logger.log('insertEvent done.   eventId='+eventId);
            deferred.resolve(eventId);
        })
        .catch((err)=> {
            if (conn) {
                db.rollbackTransaction(conn)
                    .then(()=> {
                        conn.release();
                        deferred.reject(err);
                    })
            }
            deferred.reject(err);
        });
    return deferred.promise
}


function db_insertEvent(conn, userId, eventData) {
    var deferred = q.defer();

    conn.query(queryInsertEventData, [userId, eventData.eventname, new Date(eventData.eventdate), new Date(eventData.regstart), new Date(eventData.regend), eventData.info, eventData.price, eventData.currency, eventData.minmembers, eventData.maxmembers], function (err, result) {
        if (err) {
            logger.log('db_insertEvent failed');
            logger.log(err);
            deferred.reject(err);
            return;
        }
        logger.log('db_insertEvent done');
        deferred.resolve(result.insertId);
    })
    return deferred.promise;
}

function db_insertEventFields(conn, eventId, fieldsDataString) {
    var deferred = q.defer();

    var fieldsData = JSON.parse(fieldsDataString);
    if (fieldsData.length===0){
        deferred.resolve();
        return deferred;
    }

    var fieldsDataArr = fieldsData.map((i) => {
        var valuesArr = Object.keys(i).map(key => i[key]);
        valuesArr.unshift(eventId);
        return valuesArr;
    });

    conn.query('INSERT INTO fields (eventid, name, mandatory, maxlen, mask) VALUES ?', [fieldsDataArr], function (err, result) {
        if (err) {
            logger.log('db_insertEventFields failed');
            logger.log(err);
            deferred.reject(err);
            return;
        }
        logger.log('db_insertEventFields done');
        deferred.resolve();
    });
    return deferred.promise;
}


function db_moveImagesToDb(conn, eventId, dirPath, images) {
    var deferred = q.defer();
    var promises = images.map(img => uploadImgToDb(conn, eventId, dirPath + img));
    q.all(promises)
        .then(()=> {
            logger.log('db_moveImagesToDb done');
            deferred.resolve();
        })
        .catch((err)=> {
            deferred.reject(err);
        });
    return deferred.promise;
}

function uploadImgToDb(conn, eventId, path) {
    logger.log('uploadImgToDb: ' + path);

    var deferred = q.defer();
    var fileName = path.replace(/^.*[\\\/]/, '');
    tools.getFilesize(path)
        .then(function (fileSize) {
            fs.open(path, 'r', function (status, fd) {
                if (status) {
                    logger.log(status.message);
                    deferred.reject(status);
                    return;
                }
                var buffer = new Buffer(fileSize);
                fs.read(fd, buffer, 0, fileSize, 0, function (err, num) {
                    if (err) {
                        logger.log(err);
                        deferred.reject(err);
                        return;
                    }
                    conn.query("INSERT INTO eventimg (EVENTID, NAME, IMG) VALUES (?,?,?)", [eventId, fileName, buffer], function (err, result) {
                        if (err) {
                            logger.log('uploadImgToDb failed');
                            logger.log(err);
                            deferred.reject(err);
                            return;
                        }
                        deferred.resolve();
                    })
                });
            });
        })
    return deferred.promise;
}






