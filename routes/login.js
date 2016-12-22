/**
 * Created by S on 03.12.2016.
 */
var express = require('express');
var multer = require('multer');
var path = require('path');
var favicon = require('serve-favicon');
var q = require('q');
var jwt = require('jsonwebtoken');
var md5 = require('md5');
var logger = require('../logger').getLogger("ROUTES/LOGIN");

var router = express.Router();
module.exports = router;

const saltRounds = 5;
const querySelectUser = "SELECT id FROM usr WHERE name=? and passwd=?";


router.get('/test', function (req, res, next) {
    logger.info('GET test/');
});


router.post('/test/:recipient', function (req, res, next) {
    var recipient = req.params.recipient;
    logger.info('POST test/');
    logger.debug('recipient:'+recipient);
    logger.debug(req.body);
    res.send('You data was received and rejected');
});



router.get('/', function (req, res, next) {
    logger.info('GET /login');
    res.sendFile(path.resolve(__dirname + '/../views/login.html'));
});


router.post('/', function (req, res, next) {
    logger.info('POST /login');

    if (!req.body.username || !req.body.passwd) {
        sendLoginFailed(req, res);
        return;
    }

    logger.debug('username: ' + req.body.username + '   passwd:  ' + req.body.passwd);
    logger.debug('md5:'+md5(req.body.passwd));

    checkUser(req.body.username, md5(req.body.passwd))
        .then((dbUserId) => {
            var randomTrash = Math.random().toString(36).substring(2, 10);
            randomTrash = randomTrash + Date.now();

            userdata = {userId: dbUserId, someTrash: randomTrash};
            var token = jwt.sign(userdata, config.getParam('tokenpass'));

            res.cookie('auth', token, {expire: new Date() + 30, signed: true});

            var result = {
                success: true,
                redirect: req.cookies['backlink'] || ('req.protocol' + '://' + req.get('host') + '/')
            }
            res.send(result);
        })
        .catch((err)=> {
            sendLoginFailed(req, res);
            return;
        })
});


function checkUser(username, password) {
    var deferred = q.defer();

    var rows = [];
    db.connection.query(querySelectUser, [username, password])
        .on('result', function (row) {
            rows.push(row);
        })
        .on('end', function () {
            if (rows.length < 1) {
                deferred.reject('Invalid username or password');
                return;
            }
            if (rows.length > 1) {
                logger.error('checkUser detects database problem: more than one row returned for user: ' + username);
                deferred.reject('checkUser detects database problem: more than one row returned for user: ' + username);
                return;
            }
            logger.debug('User successfuly checked. Id='+rows[0].id);
            deferred.resolve(rows[0].id);
        })
        .on('error', function (err) {
            logger.error('checkUser detects database problem while checking user: ' + username);
            logger.error(err);
            deferred.reject(err);
        });

    return deferred.promise
}


function sendLoginFailed(req, res) {
    var result = {
        err: "Invalid username or password"
    };
    res.send(result);
}




