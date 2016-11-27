/**
 * Created by S on 16.11.2016.
 */

"use strict";

var q = require('q');
var mysql  = require('mysql');

var pool = mysql.createPool(cfg.getParam('dbconfig')); // http://stackoverflow.com/questions/18496540/node-js-mysql-connection-pooling


var queryEventData = 'SELECT id,name,dt,regstart,regend,info,price,currency,minmembers,maxmembers, IFNULL(memberscount,0) memberscount, imgslist, vacancies, fields FROM v_eventdata WHERE id=?';

exports.pool = pool;

exports.connection = {
    query: function () {
        var queryArgs = Array.prototype.slice.call(arguments),
            events = [],
            eventNameIndex = {};

        pool.getConnection(function (err, conn) {
            if (err) {
                if (eventNameIndex.error) {
                    eventNameIndex.error();
                }
            }
            if (conn) {
                var q = conn.query.apply(conn, queryArgs);
                q.on('end', function () {
                    conn.release();
                });

                events.forEach(function (args) {
                    q.on.apply(q, args);
                });
            }
        });

        return {
            on: function (eventName, callback) {
                events.push(Array.prototype.slice.call(arguments));
                eventNameIndex[eventName] = callback;
                return this;
            }
        };
    }
};

exports.getConnection = function(){
    var deferred = q.defer();
    pool.getConnection(function (err, conn) {
        if (err) {
            deferred.reject(err);
        }
        else{
            deferred.resolve(conn);
        }
    });
    return deferred.promise;
};


exports.getEventData = function(eventId){
    var deferred = q.defer();

    getConnection()
        .then((conn) =>{
            conn.query(queryEventData, eventId, (err, result) => {
                if (err){
                    deferred.reject(err);
                    return;
                }
                if (result.length<1){
                    deferred.reject("No data found");
                    return;
                }
                if (result.length>1){
                    deferred.reject("Too many rows");
                    return;
                }
                deferred.resolve(result[0]);
            })
        })
        .catch((err)=>{
            deferred.reject(err);
        })
    return deferred.promise;
}


