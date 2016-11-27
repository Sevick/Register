
var fs = require('fs');
var extend = require('node.extend');

var configpath = './config/register.conf';

var config = {
    port: '3001',
    dbconfig: {
        host: 'localhost',
        user: 'register',
        password: 'gfhjkm',
        database: 'register'
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
    logger.log("Reading config: "+configpath);
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
        logger.log("Error reading config");
        logger.log(err);
        writeConfig();
    }
    return configFile;
}

function writeConfig() {
    logger.log("writeConfig: "+configpath);
    logger.log(config);
    logger.log(JSON.stringify(config));
    fs.writeFileSync(configpath, JSON.stringify(config));
}