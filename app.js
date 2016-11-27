var express = require('express');
var multer = require('multer')
var fs = require('fs');
var path = require('path');
var favicon = require('serve-favicon');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
global.logger = require('./logger')();
global.cfg = require('./config')();
global.db = require('./dbhelper');
global.tools = require('./tools');

var app = express();
var http = require('http').Server(app);
app.set('view engine', 'ejs');


var event = require('./routes/event');
var invite = require('./routes/invite');
var register = require('./routes/register');
var registered = require('./routes/registered');
var memberslist = require('./routes/memberslist');


// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(cookieParser());

app.use(express.static(path.join(__dirname, 'views')));
app.use(express.static(path.join(__dirname, 'public')));


app.use('/event',event);
app.use('/invite', invite);
app.use('/register', register);
app.use('/registered', registered);
app.use('/memberslist', memberslist);


http.listen(config.getParam('port'), function () {
    logger.log('listening on port ' + config.getParam('port'));
});



/*

 app.post('/login', function(req, res) {
 User.findOne({ email: req.body.email }, function(err, user) {
 if (!user) {
 res.render('login.jade', { error: 'Invalid email or password.' });
 } else {
 if (req.body.password === user.password) {
 // sets a cookie with the user's info
 req.session.user = user;
 res.redirect('/dashboard');
 } else {
 res.render('login.jade', { error: 'Invalid email or password.' });
 }
 }
 });
 });
 */




