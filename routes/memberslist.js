/**
 * Created by S on 27.11.2016.
 */
//Created By Benya!!!
"use strict";

var express = require('express');
var multer = require('multer');
var fs = require('fs');
var path = require('path');
var favicon = require('serve-favicon');
var q = require('q');

var router = express.Router();
module.exports = router;

router.post('/delmember', function (req, res) {
    logger.log('POST /memberslist/delmember ID=' + req.body.memberid);

    db.connection.query("DELETE FROM register.eventmember WHERE memberid=?", [req.body.memberid])
        .on('result', function (dbQeryRes) {
            res.end("deleted");
        })
        .on('error', function (err) {
            logger.log("Error  deleting");
            logger.log(err);
            res.end("Error deleting");
        });
});


router.get('/', function (req, res) {
    // ?id=XXX
    logger.log('GET /memberslist');

    var eventId = req.query.id;

    if (!eventId) {
        logger.log('ID is not specified');
        res.send('ID is not specified. Use /memberslist?id=XXX where XXX is the routeEvent ID');
        return;
    }

    var result;
    db.getEventData(eventId)
        .then((dbEventDataResult) => {
            result=dbEventDataResult;
            return db.getMembersData(eventId);
        })
        .then((dbMembersData) =>{
            result.memberslist=dbMembersData;
            res.render('memberslist', result);
        })
        .catch((err) => {
            logger.log(err);
            res.end(err);
        })
})


