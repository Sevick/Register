var express = require('express');
var multer = require('multer')
var fs = require('fs');
var path = require('path');
var favicon = require('serve-favicon');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var logger = require('./logger').getLogger("APP");


global.cfg = require('./config')();
global.db = require('./dbhelper');
global.tools = require('./tools');
global.mail = require('./mail');

var app = express();
var http = require('http').Server(app);
app.set('view engine', 'ejs');


var routeEvent = require('./routes/route_event');
var invite = require('./routes/invite');
var register = require('./routes/register');
var registered = require('./routes/registered');
var memberslist = require('./routes/memberslist');
var login = require('./routes/login');


// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser("asdfasdfkjhlkjhgslkdfjghlsdkfjgh"));

app.use(express.static(path.join(__dirname, 'views')));
app.use(express.static(path.join(__dirname, 'public')));

app.use('/login', login);
app.use('/event',routeEvent);
app.use('/invite', invite);
app.use('/register', register);
app.use('/registered', registered);
app.use('/memberslist', memberslist);


http.listen(config.getParam('port'), function () {
    logger.info('listening on port ' + config.getParam('port'));
});