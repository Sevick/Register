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
var logger = require('../logger').getLogger("ROUTES/ROUTE_EVENT");

var router = express.Router();
module.exports = router;

const querySelectEventImg = "SELECT img FROM eventimg WHERE eventid=? and name=?";


router.get('/', auth.checkAuth, function (req, res, next) {

    if (!req.query.id) {
        // routeEvent create request
        var newEventData={
            eventdata: '',
            action: 'Create',
            fields: ''
        };
        res.render('event', newEventData);
        //res.sendFile(path.resolve(__dirname + '/../views/routeEvent.html'));
    }
    else{
        // routeEvent update request
        db.getEventData(req.query.id)
            .then((result) => {
                result.action = 'Update';
                res.render('event', result);
            })
            .catch((err) => {
                logger.error(err);
                res.send(err);
            })
    }
    
});



router.post('/newevent', auth.checkAuth, function (req, res) {
    logger.info("POST /newevent");
    //logger.log(req.body);

    logger.debug('req.userId='+req.userId);

    if (!req.body.eventId) {
        // insert new routeEvent
        logger.debug("Creating new event");
        insertEvent(req.userId, req.body)
            .then((newEventId)=> {
                logger.debug("insertEvent done.  newEventId=" + newEventId);
                sendResponseInvite(req, res, newEventId);
            })
            .catch((err) => {
                sendResposnseErr(err);
                return;
            });
    }
    else{
        // update existing routeEvent
        logger.debug("Updating existing event");
        var removedFilesArray=JSON.parse(req.body.customFieldsUpdatesArray);
        var conn;
        db.getConnection()
            .then((dbconnect) => {
                conn = dbconnect;
                return db.beginTransaction(conn);
            })
            .then(()=>{
                if (removedFilesArray.length>0) {
                    logger.debug('removing images');
                    logger.debug(removedFilesArray);
                    conn.query(queryRemoveImages, [req.body.eventId,removedFilesArray], function (err, result) {
                        if (err) {
                            logger.error('Error acquired trying to remove images');
                            logger.error(err);
                        }
                    });
                }
            })
            .then(()=>{
                logger.debug('db_insertEventFields');
                return eventModel.db_insertEventFields(conn, req.body.eventId, req.body.customFields);
            })
            .then(()=>{
                return addImages(conn, req.body.eventId, req.body);
            })
            .then(()=>{
                return db.commitTransaction(conn);
            })
            .then(()=>{
                logger.debug('update done');
                sendResponseInvite(req, res, req.body.eventId);
            })
            .catch((err)=>{
                logger.error(err);
            })
    }
});

function sendResponseInvite(req, res, newEventId){
    logger.debug('sendResponseInvite');
    var responsedata = {
        status: "success",
        eventId: newEventId,
        host: req.protocol + '://' + req.get('host'),
        redirect: req.protocol + '://' + req.get('host') + '/invite?id=' + newEventId
    };
    res.send(responsedata);
}

function sendResposnseErr(req, res, err){
    var responsedata = {
        status: "err",
        err: err,
    };
    res.send(responsedata);
}



router.post('/file-upload', function (req, res) {
    logger.info('POST /file-upload');
    var eventRandomHash = req.query.hash;
    var uploadPath = './uploads/' + eventRandomHash + '/';

    tools.checkCreateDir(uploadPath)
        .then(function (msg) {
            var storage = multer.diskStorage({
                destination: function (request, file, callback) {
                    callback(null, uploadPath);
                },
                filename: function (request, file, callback) {
                    logger.debug(file);
                    callback(null, file.originalname)
                }
            });
            var upload = multer({storage: storage}).array('file', 5);

            upload(req, res, function (err) {
                if (err) {
                    logger.error('Error Occured' + err);
                    logger.error(err.stack);
                    return;
                }
                logger.debug(req.files);
                logger.debug('Images uploaded');
                res.end('Your Files Uploaded');
            })
        })
        .catch(function (err) {
            res.end('Failed to upload file');
        });
});

router.get('/image', function (req, res) {
    // ?id=XXX&img=XXXXX
    logger.info('GET /image');
    var eventId = req.query.id;
    var imageName = req.query.img;
    logger.debug("eventId=" + eventId + "  imageName=" + imageName);

    if (!eventId || !imageName) {
        res.end('');
        return;
    }
    db.connection.query(querySelectEventImg, [eventId, imageName])
        .on('result', function (row) {
            logger.debug("Image retrieved:  eventId=" + eventId + "  name=" + imageName);
            var imageExt = tools.getFileExt(imageName);
            res.writeHead(200, {'Content-Type': 'image/' + imageExt});
            res.write(row.img);
            res.end();
        })
        .on('error', function (err) {
            logger.error("Error while retrieving image:  eventId=" + eventId + "  name=" + imageName);
            logger.error(err);
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
            logger.debug('db_insertEventFields');
            return eventModel.db_insertEventFields(conn, eventId, eventData.customFields);
        })
        .then(() => {
            logger.debug('db_moveImagesToDb');
            return addImages(conn,eventId,eventData);
            
/*
            var imagesArray = JSON.parse(eventData.uploadedFilesArray);
            var dirPath = './uploads/' + eventData.eventRandomHash;
            return db_moveImagesToDb(conn, eventId, dirPath + '/', imagesArray);
*/
        })
        .then(()=> {
            logger.debug('commit');
            return db.commitTransaction(conn);
        })
        .then(()=> {
            //logger.log('insertEvent done.   eventId='+eventId);
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










