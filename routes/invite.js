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

var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  logger.log('invite/   '+req.query.id);

  if (req.query.id){

    logger.log('Quering database...');
    var rows=[];
    db.connection.query("SELECT NAME,DT FROM event WHERE ID=?", req.query.id)
        .on('result', function (row) {
          logger.log("Data retrieved from db for event with id=" + req.query.id);
          logger.log(row);
          rows.push(row);
          sendInviteResponse(req, res,req.query.id,row.NAME, row.DT);
        })
        .on('end', function(){
          logger.log('Query finished');
          if (rows.length<1){
            logger.log("No data found");
          }
        })
        .on('error', function (err) {
          logger.log("Error while inserting into event");
          logger.log(err);
        });
  }
  else{
    logger.log("event id not specified");
    res.send('event id not specified');
  }
});

function sendInviteResponse(req, res, eventId, eventName, eventDate){
  logger.log('sendIniteResponse');
  var params = {
    eventId: eventId,
    eventName: eventName,
    registrationUrl: req.protocol + '://' + req.get('host')+'/register?id='+eventId
  };
  res.render('invite',params);

}


module.exports = router;
