
var fs = require('fs');
var extend = require('node.extend');
var logger = require('./logger').getLogger("CONFIG");

var configpath = './config/register.conf';

var config = {
    port: '3001',
    tokenpass: 'cvb66yuyLJFRI336B4VMtivb226nvitFKQPLKPQA96AAbg890fbnhbnsm',
    dbconfig: {
        host: 'localhost',
        user: 'register',
        password: 'gfhjkm',
        database: 'register'
    },
    mailconfig:{
        smtp: {
            host: "mail.fbytes.com", // hostname
            secure: false,           // use SSL
            port: 25,                // port for secure SMTP
            auth: {
                user: "eventservice@fbytes.com",
                pass: "q35a96bbq"
            },
            tls: {
                rejectUnauthorized: false
            }
        },

        from: 'Eventer<eventservice@fbytes.com>',
        replyto: 'eventservice@fbytes.com',
    }
};


module.exports = function () {
    if (global.config === undefined) {
        init();
        global.config = new Config();
    }
    return global.config;
};


function Config() {
    return {
        getParam: getParam,
    }
}


function getParam(param) {
    return config[param];
}


function init() {
    logger.info("Reading config: "+configpath);
    try {
        var configFile = fs.readFileSync(configpath, 'utf8', 'r');
        if (!configFile) {
            writeConfig();
        }
        else {
            config = extend(config, JSON.parse(configFile));
        }
    }
    catch (err) {
        logger.error("Error reading config");
        logger.error(err);
        writeConfig();
    }
    return configFile;
}

function writeConfig() {
    logger.info("writeConfig: "+configpath);
    logger.debug(JSON.stringify(config));
    fs.writeFileSync(configpath, JSON.stringify(config));
}