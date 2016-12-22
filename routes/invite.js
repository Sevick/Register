/*
 Invite links
 */

"use strict";

var express = require('express');
var multer = require('multer')
var fs = require('fs');
var path = require('path');
var favicon = require('serve-favicon');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var logger = require('../logger').getLogger("ROUTES/INVITE");

var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function (req, res, next) {
    logger.info('invite/   ' + req.query.id);

    if (req.query.id) {

        logger.debug('Quering database...');
        var rows = [];
        db.connection.query("SELECT NAME,DT FROM event WHERE ID=?", req.query.id)
            .on('result', function (row) {
                logger.debug("Data retrieved from db for event with id=" + req.query.id);
                logger.debug(row);
                rows.push(row);
                sendInviteResponse(req, res, req.query.id, row.NAME, row.DT);
            })
            .on('end', function () {
                logger.debug('Query finished');
                if (rows.length < 1) {
                    logger.debug("No event found with this id: "+req.query.id);
                    sendErrResponse(req, res, "No event found with this id: "+req.query.id);
                }
            })
            .on('error', function (err) {
                logger.error("Error while retriving data for event with id "+req.query.id);
                logger.error(err);
                sendErrResponse(req, res, "Error while retriving data for event with id "+req.query.id);

            });
    }
    else {
        logger.info("event id not specified");
        sendErrResponse(req, res, "event id not specified")
    }
});

function sendErrResponse(req, res, err) {
    var errdata = {
        status: "error",
        errmsg: err
    };
    res.render('error',errdata);
}


function sendInviteResponse(req, res, eventId, eventName, eventDate) {
    logger.info('sendIniteResponse');
    var params = {
        eventId: eventId,
        eventName: eventName,
        registrationUrl: req.protocol + '://' + req.get('host') + '/register?id=' + eventId
    };
    res.render('invite', params);

}


module.exports = router;
