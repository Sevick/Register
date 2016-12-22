/**
 * Created by S on 24.11.2016.
 */
"use strict";

var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var q = require('q');
var logger = require('../logger').getLogger("ROUTES/REGISTERED");

var express = require('express');
var router = express.Router();
module.exports = router;


const queryUpdateConfirm = "UPDATE eventmember SET confirmed=1 where memberid=? and confirmcode=?";
const queryCheckConfirm = "SELECT confirmed FROM eventmember WHERE memberid=? and confirmcode=?";
const queryCheckMemberAlreadyConfirmed = "SELECT confirmed FROM eventmember WHERE memberid=?";

router.get('/', function (req, res, next) {
    logger.info('GET registered/ ' + req.query.id);
    if (!req.query.id) {
        sendWrongRequest(req, res, 'Member id is not specified');
    }

    checkMemberAlreadyConfirmed(req.query.id)
        .then((result) => {
            var data = {
                eventmemberid: req.query.id
            }
            res.render('registered', data)

        })
        .catch((err)=> {
            logger.error(err);
            sendWrongRequest(req, res, err);
        });

});

router.post('/confirm', function (req, res, next) {
    logger.info('POST registered/confirm/   ' + req.query.id);
    if (!req.query.id) {
        sendWrongRequest(req, res, 'Invalid request');
    }

    checkUpdateMemberConfirmation(req.query.id, req.body.confirmCode)
        .then(()=> {
            var result = {
                status: "success"
            }
            res.send(result);
        })
        .catch((err)=> {
            var result = {
                status: "err",
                errmsg: err
            }
            res.send(result);
        })
});


router.get('/confirm', function (req, res, next) {
    logger.info('GET registered/confirm/   ' + req.query.id);

    if (!req.query.id || !req.query.confirm) {
        sendWrongRequest(req, res, 'Ivalid request');
    }

    checkUpdateMemberConfirmation(req.query.id, req.query.confirm)
        .then(()=> {
            var result = {
                status: "success"
            }
            res.sendFile(path.resolve(__dirname + '/../views/confirmed.html'));
        })
        .catch((err)=> {
            var result = {
                status: "err",
                errmsg: err
            }
            sendWrongRequest(req, res, err);
        })
});

function sendWrongRequest(req, res, err) {
    logger.debug("sendWrongRequest");
    var errdata = {
        status: "error",
        errmsg: err
    };
    res.render('error', errdata);
}

function checkMemberAlreadyConfirmed(memberId) {
    var deferred = q.defer();
    var conn;
    db.getConnection()
        .then((connection) => {
            conn = connection;
            conn.query(queryCheckMemberAlreadyConfirmed, [memberId], (err, result) => {
                if (err) {
                    deferred.reject(err);
                }
                logger.debug(result);
                if (!result || !result[0]) {
                    logger.debug('checkUpdateMemberConfirmation: No data found');
                    deferred.reject('Invalid code');
                }
                else if (result.length > 1) {
                    logger.error("checkUpdateMemberConfirmation detects TooManyRows");
                    deferred.reject('Internal error');
                }
                else if (result[0].confirmed == 1) {
                    deferred.reject('Already confirmed');
                }
                else if (result[0].confirmed == 0) {
                    deferred.resolve(result);
                }
                else {
                    logger.error('Unknown state');
                    deferred.reject("Internal error")
                }
                conn.release();
            });
        })
        .catch((err)=> {
            if (conn)
                conn.release();
            logger.error(err);
        });

    return deferred.promise;
}


function checkUpdateMemberConfirmation(memberId, confirmCode) {
    var deferred = q.defer();

    var rows = [];

    var conn;
    db.getConnection()
        .then((connection) => {
            conn = connection;
            return checkConfirmation(conn, memberId, confirmCode);
        })
        .then((result)=> {
            return updateConfirmation(conn, memberId, confirmCode);
        })
        .then((result)=> {
            conn.release();
            deferred.resolve(result);
        })
        .catch((err)=> {
            if (conn)
                conn.release();
            deferred.reject(err);
        })

    return deferred.promise;
}


function checkConfirmation(conn, memberId, confirmCode) {
    var deferred = q.defer();

    logger.debug("memberId=" + memberId + "  confirmCode=" + confirmCode);

    conn.query(queryCheckConfirm, [memberId, confirmCode], (err, result) => {
        if (err) {
            deferred.reject(err);
        }
        logger.debug(result);
        if (!result || !result[0] || result.affectedRows < 1) {
            logger.debug('checkUpdateMemberConfirmation: No data found');
            deferred.reject('Invalid code');
            return;
        }
        if (result.length > 1) {
            logger.error("checkUpdateMemberConfirmation detects TooManyRows");
            deferred.reject('Internal error');
            return;
        }
        logger.debug("result.confirmed");
        logger.debug(result[0].confirmed);
        if ((result[0].confirmed) == 1) {
            deferred.reject('Already confirmed');
        }
        else {
            deferred.resolve(result);
        }
    });

    return deferred.promise;
}


function updateConfirmation(conn, memberId, confirmCode) {
    var deferred = q.defer();

    conn.query(queryUpdateConfirm, [memberId, confirmCode], (err, result)=> {
        if (err) {
            logger.error(err);
            deferred.reject(err)
        }
        deferred.resolve(result);
    });
    return deferred.promise;
}