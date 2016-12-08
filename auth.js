/**
 * Created by S on 04.12.2016.
 */

"use strict";

var jwt = require('jsonwebtoken');

exports.checkAuth =checkAuth;

function checkAuth(req, res, next) {
    logger.log('checkAuth');
    //  if the user isn't logged in, redirect them to a login page, save original request url to cookies (backlink)
    if(!req.signedCookies['auth']) {
        authFailed(req,res);
        return;
    }
    else{
        jwt.verify(req.signedCookies['auth'], config.getParam('tokenpass'), function(err, decoded) {
            if (err) {
                authFailed(req,res);
                return;
            }
            logger.log('Auth: Decoded userId='+decoded.userId);
            req.userId=decoded.userId;
            next();
        });
    }
}

function authFailed(req,res){
    logger.log('authFailed');
    logger.log('backlink='+ req.protocol + '://' + req.get('host') + req._parsedOriginalUrl.pathname);
    res.cookie('backlink', req.protocol + '://' + req.get('host') + req._parsedOriginalUrl.pathname);
    res.redirect("/login");

}


