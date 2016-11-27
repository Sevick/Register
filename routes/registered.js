/**
 * Created by S on 24.11.2016.
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

var express = require('express');
var router = express.Router();
module.exports = router;

router.get('/', function (req, res, next) {
    logger.log('GET registered/   ' + req.query.id);
    res.render('registered','')
});