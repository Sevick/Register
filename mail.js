/**
 * Created by S on 27.11.2016.
 */


"use strict";

var q = require('q');
var nodemailer = require('nodemailer');
var logger = require('./logger').getLogger("MAIL");

var transporter = nodemailer.createTransport(config.getParam('mailconfig').srvpath);


var transporter = nodemailer.createTransport(config.getParam('mailconfig').smtp);



/*
var smtpTransport = nodemailer.createTransport("SMTP",{
    service: "Fbytes",
    auth: {
        user: "bar@foo.com",
        pass: "PASSWORD"
    }
});
*/

exports.sendMail = function(toAddress, subject, content){

    //logger.log(config.getParam('mailconfig').srvpath);


    var deferred = q.defer();

    var mailOptions = {
        from: config.getParam('mailconfig').from,
        to: toAddress,
        replyTo: config.getParam('mailconfig').replyto,
        subject: subject,
        html: content
    };

    transporter.sendMail(mailOptions, (err, info) =>{
        if (err){
            deferred.reject(err);
            return;
        }
        deferred.resolve(info.response);

    });

    return deferred.promise;
};