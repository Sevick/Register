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


router.get('/', function (req, res) {
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
            //******************
            logger.log(result.memberslist);

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
        logger.log("Pivot sql: ");
        logger.log(result[0].pivotsql);
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