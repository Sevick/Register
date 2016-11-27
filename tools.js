/**
 * Created by S on 23.11.2016.
 */

"use strict";

var fs = require('fs');
var q = require('q');


exports.getFileExt = function(path) {
    return path.slice((path.lastIndexOf(".") - 1 >>> 0) + 2);
}


exports.getFilesize = function(path) {
    var deferred = q.defer();
    fs.stat(path, function (err, stats) {
        if (!err) {
            deferred.resolve(stats.size);
        }
        else {
            logger.log("getFilesize error");
            deferred.reject(err);
        }
    });

    return deferred.promise;
}


exports.checkCreateDir = function(path) {
    var deferred = q.defer();
    fs.access(path, fs.constants.R_OK | fs.constants.W_OK, (err) => {
        if (err) {
            //logger.log(err);
            fs.mkdir(path, (err) => {
                if (err && err.code!=='EEXIST') {       // 4075 - file already exists
                    logger.log("Unable to create directory: " + path);
                    logger.log(err);
                    deferred.reject("Unable to create directory");
                }
                else {
                    deferred.resolve("Directory created");
                }
            })
        }
        else {
            deferred.resolve("Directory exists");
        }
    });
    return deferred.promise;
}