/**
 * Created by S on 08.12.2016.
 */

"use strict";

var fs = require('fs');
var q = require('q');


exports.dbInsertEvent = db_insertEvent;
exports.db_insertEventFields = db_insertEventFields;
exports.db_moveImagesToDb = db_moveImagesToDb;
exports.uploadImgToDb = uploadImgToDb;


const queryInsertEventData = "INSERT INTO event (USRID,NAME,DT,REGSTART,REGEND,INFO,PRICE,CURRENCY,MINMEMBERS,MAXMEMBERS) VALUES (?,?,?,?,?,?,?,?,?,?)";
//const queryRemoveImages = "DELETE FROM eventimg WHERE eventid=? and name=ANY(?)";
const queryRemoveImages = "DELETE FROM eventimg WHERE eventid=? and name IN (?)";
const queryInsertFields = "INSERT INTO fields (eventid, name, mandatory, maxlen, mask) VALUES ?";


function db_insertEvent(conn, userId, eventData) {
    var deferred = q.defer();

    conn.query(queryInsertEventData, [userId, eventData.name, new Date(eventData.dt), new Date(eventData.regstart), new Date(eventData.regend), eventData.info, eventData.price, eventData.currency, eventData.minmembers, eventData.maxmembers], function (err, result) {
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

    conn.query(queryInsertFields, [fieldsDataArr], function (err, result) {
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