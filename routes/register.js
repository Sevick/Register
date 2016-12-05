/*
 Event members registration form
 */

"use strict";

var express = require('express');
var multer = require('multer')
var fs = require('fs');
var path = require('path');
var favicon = require('serve-favicon');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var q = require('q');
var ejs = require('ejs');

var express = require('express');
var router = express.Router();
module.exports = router;

//const queryEventData = "SELECT id,name,dt,regstart,regend,info,price,currency,minmembers,maxmembers, IFNULL(memberscount,0) memberscount, imgslist, vacancies, fields FROM v_eventdata WHERE id=?";
const queryInsertMemberdata="INSERT INTO memberdata (memberID,FIELDID,DATA) VALUES (?,?,?)";
const queryInsertMember="INSERT INTO eventmember (EVENTID,CONFIRMCODE,EMAIL) VALUES (?,?,?)";

/* GET members listing. */

router.get('/test', function (req, res, next) {
    logger.log('GET test/');

    var data = {
        eventName: 'Neverland party'
    }

    var renderOptions = {};

    ejs.renderFile('./views/registeremail.ejs', data, renderOptions, (err, renderedHtml) => {
        // str => Rendered HTML string
        if (err) {
            logger.log('Unable to render registeremail.ejs');
            logger.log(err);
            return;
        }

        mail.sendMail('sevick.v@gmail.com', 'Mailer test', renderedHtml)
            .then(()=> {
                logger.log('Mail sent');
            })
            .catch((err)=> {
                logger.log('Mail send error:');
                logger.log(err);
            });
    });
});


router.get('/', function (req, res, next) {
    logger.log('GET register/   ' + req.query.id);

    if (!req.query.id) {
        logger.log("event id not specified");
        res.send('event id not specified');
        return;
    }

    db.getEventData(req.query.id)
        .then((result) => {
            res.render('register', result);
        })
        .catch((err) => {
            logger.log(err);
            res.send(err);
        })
});

router.post('/', function (req, res, next) {
    logger.log('POST register/   ' + req.query.id);

    if (req.query.id) {

        insertEventmember(req.body)
            .then(function () {
                logger.log("Data sumbitted to db");
                sendRegistered(req, res, req.query.id);
            })
            .catch((err) => {
                logger.log("Failed to submit data to db");
                logger.log(err);
            });

    }
    else {
        logger.log("event id not specified");
        res.send('event id not specified');
    }
});


function insertEventmember(memberData) {
    var deferred = q.defer();
    var conn;
    db.getConnection()
        .then((conn) => {
            conn.beginTransaction(function (err) {
                if (err) {
                    deferred.reject(err);
                    return;
                }

                if (!memberData['email']) {
                    logger.log(memberData);
                    deferred.reject('Email not specified');
                    return;
                }

                var confirmCode = Math.random().toString(36).substring(2, 10);
                confirmCode = confirmCode + Date.now();

                conn.query(queryInsertMember, [memberData.eventId, confirmCode, memberData['email']], function (err, result) {
                    if (err) {
                        logger.log(err);
                        return conn.rollback(function () {
                            deferred.reject(err);
                        });
                    }

                    var eventmemberId = result.insertId;
                    logger.log("eventmemberId=" + eventmemberId);

                    var promises = [];
                    for (var memberDataFieldIdx in memberData) {
                        if (memberDataFieldIdx !== 'eventId' && memberDataFieldIdx !== 'email') {
                            promises.push(insertmemberData(conn, eventmemberId, memberDataFieldIdx, memberData[memberDataFieldIdx]));
                        }
                    }

                    q.all(promises)
                        .then((values) => {
                            conn.commit((err) => {
                                if (err) {
                                    conn.rollback(function () {
                                        deferred.reject(err);
                                        conn.release();
                                        return;
                                    });
                                }
                                conn.release();
                                deferred.resolve();
                            });

                        })
                        .catch((err) => {
                            logger.log('Error while inserting fields data');
                            logger.log(err);
                            deferred.reject(err);
                        });
                })


            });
        })
        .catch((err) => {
            logger.log('Unable to connect to database');
            logger.log(err);
        })


    return deferred.promise;
}


function insertmemberData(conn, memberId, fieldId, fieldData) {
    var deferred = q.defer();

    //logger.log('field #' + fieldId + '  insert Data: ' + fieldData);
    conn.query(queryInsertMemberdata, [memberId, fieldId, fieldData], function (err, result) {
        if (err) {
            deferred.reject(err);
            return;
        }
        //logger.log('OK');
        deferred.resolve(result.insertId);
    })
    return deferred.promise;
}

function sendRegistered(req, res, eventId) {
    var response = {
        host: req.protocol + '://' + req.get('host'),
        redirect: req.protocol + '://' + req.get('host') + '/registered?id=' + eventId
    };
    res.send(response);
}








