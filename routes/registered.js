/**
 * Created by S on 24.11.2016.
 */
"use strict";

var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var q = require('q');

var express = require('express');
var router = express.Router();
module.exports = router;


const queryCheckConfirm="UPDATE eventmember SET confirmed=1 where memberid=? and confirmcode=?";

router.get('/', function (req, res, next) {
    logger.log('GET registered/ '+req.query.id);
    if (!req.query.id){
        sendWrongRequest();
    }
    var data= {
        eventmemberid: req.query.id
    }
    res.render('registered',data)
});

router.post('/confirm', function (req, res, next) {
    logger.log('POST registered/confirm/   ' + req.query.id);
    if (!req.query.id){
        sendWrongRequest();
    }

    checkMemberConfirmation(req.query.id,req.body.confirmCode)
        .then(()=>{
            var result={
                status: "success"
            }
            res.send(result);
        })
        .catch((err)=>{
            var result={
                status: "err",
                errmsg: err
            }
            res.send(result);
        })
});


router.get('/confirm', function (req, res, next) {
    logger.log('GET registered/confirm/   ' + req.query.id);

    if (!req.query.id || !req.query.confirm){
        sendWrongRequest();
    }

    checkMemberConfirmation(req.query.id,req.query.confirm)
        .then(()=>{
            var result={
                status: "success"
            }
            res.sendFile(path.resolve(__dirname + '/../views/confirmed.html'));
        })
        .catch((err)=>{
            var result={
                status: "err",
                errmsg: err
            }
            sendWrongRequest();
        })
});

function sendWrongRequest(){
    res.send('Wrong request');
}


function checkMemberConfirmation(memberId,confirmCode){
    var deferred = q.defer();

    var rows = [];
    db.connection.query(queryCheckConfirm, [memberId, confirmCode])
        .on('result', function (row) {
            rows.push(row);
        })
        .on('end', function () {
            if (rows.length < 1) {
                deferred.reject('Invalid confirmation code');
                return;
            }
            if (rows.length > 1) {
                logger.log('checkMemberConfirmation detects database problem: more than one row updated for eventmember: ' + memberId);
                deferred.reject('checkMemberConfirmation detects database problem: more than one row updated for eventmember: ' + memberId);
                return;
            }
            deferred.resolve(rows[0].id);
        })
        .on('error', function (err) {
            logger.log('checkMemberConfirmation detects database problem while checking eventmember: ' + memberId);
            logger.log(err);
            deferred.reject(err);
        });


    return deferred.promise;
}