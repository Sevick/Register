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
var eventModel = require('../model/event');


var router = express.Router();
module.exports = router;

const querySelectEventImg = "SELECT img FROM eventimg WHERE eventid=? and name=?";


router.get('/', auth.checkAuth, function (req, res, next) {

    if (!req.query.id) {
        // routeEvent create request
        var newEventData={
            eventdata: '',
            fields: ''
        };
        res.render('event', newEventData);
        //res.sendFile(path.resolve(__dirname + '/../views/routeEvent.html'));
    }
    else{
        // routeEvent update request
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

    if (!req.body.eventId) {
        // insert new routeEvent
        insertEvent(req.userId, req.body)
            .then((newEventId)=> {
                logger.log("insertEvent done.  newEventId=" + newEventId);
                sendResponseInvite(req, res, eventId);
            })
            .catch((err) => {
                sendResposnseErr(err);
                return;
            });
    }
    else{
        // update existing routeEvent
        var removedFilesArray=JSON.parse(req.body.removedFilesArray);
        var conn;
        db.getConnection()
            .then((dbconnect) => {
                conn = dbconnect;
                return db.beginTransaction(conn);
            })
            .then(()=>{
                if (removedFilesArray.length>0) {
                    logger.log('removing images');
                    logger.log(removedFilesArray);
                    conn.query(queryRemoveImages, [req.body.eventId,removedFilesArray], function (err, result) {
                        if (err) {
                            logger.log('Error acquired trying to remove images');
                            logger.log(err);
                        }
                    });
                }
            })
            .then(()=>{
                return addImages(conn, req.body.eventId, req.body);
            })
            .then(()=>{
                return db.commitTransaction(conn);
            })
            .then(()=>{
                logger.log('update done');
                sendResponseInvite(req, res, req.body.eventId);
            })
            .catch((err)=>{
                logger.log(err);
            })
    }
});

function sendResponseInvite(req, resp, newEventId){
    var responsedata = {
        eventId: newEventId,
        host: req.protocol + '://' + req.get('host'),
        redirect: req.protocol + '://' + req.get('host') + '/invite?id=' + newEventId
    };
    resp.send(responsedata);
}

function sendResposnseErr(req, resp, err){
    var responsedata = {
        err: err,
    };
    resp.send(responsedata);
}



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
            return eventModel.dbInsertEvent(conn, userId,eventData);
        })
        .then((newEventId)=> {
            eventId = newEventId;
            logger.log('db_insertEventFields');
            return eventModel.db_insertEventFields(conn, eventId, eventData.customFields);
        })
        .then(() => {
            logger.log('db_moveImagesToDb');
            return addImages(conn,eventId,eventData);
            
/*
            var imagesArray = JSON.parse(eventData.uploadedFilesArray);
            var dirPath = './uploads/' + eventData.eventRandomHash;
            return db_moveImagesToDb(conn, eventId, dirPath + '/', imagesArray);
*/
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

function addImages(conn,eventId,eventData) {
    //if (eventData.uploadedFilesArray) {
        var imagesArray = JSON.parse(eventData.uploadedFilesArray);
        var dirPath = './uploads/' + eventData.eventRandomHash;
        return eventModel.db_moveImagesToDb(conn, eventId, dirPath + '/', imagesArray);
    //}
}










