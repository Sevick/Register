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
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
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
        res.send('ID is not specified. Use /memberslist?id=XXX where XXX is the event ID');
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

/*    var conn;
    db.getConnection()
        .then((connection) => {
            conn=connection;
            return getSqlForDataRetrive(conn, eventId);
        })
        .then((sqltext) => {
            return getMemebersListData(conn, eventId, sqltext);
        })
        .then((rows) => {
            conn.release();
            var result = {
                eventId: eventId,
                memberslist: rows
            };
            logger.log(result.memberslist);

            res.render('memberslist', result);
        })
        .catch((err)=> {
            if (conn)
                conn.release();
            logger.log("Error accuired while retriving data from database");
            logger.log(err);
            res.send("Error accuired while retriving data from database");
        })*/
})


