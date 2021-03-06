/**
 * Created by S on 16.11.2016.
 */

"use strict";

var q = require('q');
var mysql = require('mysql');
var logger = require('./logger').getLogger("DBHELPER");

var pool = mysql.createPool(cfg.getParam('dbconfig')); // http://stackoverflow.com/questions/18496540/node-js-mysql-connection-pooling


const queryEventData = 'SELECT id,name,dt,regstart,regend,info,price,currency,minmembers,maxmembers, IFNULL(memberscount,0) memberscount, imgslist, vacancies, fields FROM v_eventdata WHERE id=?';

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
                q.on('end', () =>  {
                    conn.release();
                });

                events.forEach((args) => {
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

exports.getConnection = getConnection;
exports.beginTransaction = beginTransaction;
exports.getEventData = getEventData;
exports.getMembersData = getMembersData;
exports.commitTransaction = commitTransaction;
exports.rollbackTransaction = rollbackTransaction;


//-----------------------------------------------------------------------------------------------------------------
function getConnection() {
    var deferred = q.defer();
    pool.getConnection(function (err, conn) {
        if (err) {
            deferred.reject(err);
        }
        else {
            deferred.resolve(conn);
        }
    });
    return deferred.promise;
};

function beginTransaction(conn) {
    var deferred = q.defer();

    conn.beginTransaction(function (err) {
        if (err) {
            deferred.reject(err);
            return;
        }
        deferred.resolve();
    });

    return deferred.promise;
}

function commitTransaction(conn) {
    var deferred = q.defer();
    conn.commit((err) => {
        if (err) {
            deferred.reject(err);
        }
        deferred.resolve();
    });

    return deferred.promise;
}

function rollbackTransaction(conn) {
    var deferred = q.defer();

    conn.rollback(function () {
        deferred.resolve();
    });

    return deferred.promise;
}

//-----------------------------------------------------------------------------------------------------------------
function getEventData(eventId) {
    var deferred = q.defer();
    logger.debug('getEventData quering database...');
    getConnection()
        .then((conn) => {
            conn.query(queryEventData, eventId, (err, result) => {
                conn.release();
                if (err) {
                    deferred.reject(err);
                    return;
                }
                if (result.length<1 || result[0].constructor.name!=='RowDataPacket') {
                    logger.debug('getEventData: No data found');
                    deferred.reject('No data found');
                    return;
                }
                if (result.length > 1) {
                    deferred.reject('Too many rows');
                    return;
                }

                try {
                    var fields = JSON.parse(result[0].fields);
                    delete result[0].fields;
                    //logger.log(result[0]);
                    var result = {
                        eventdata: result[0],
                        fields: fields
                    }
                    deferred.resolve(result);
                }
                catch (err) {
                    logger.error('Error on processing data in getEventData for routeEvent ' + eventId);
                    logger.error(err);
                    deferred.reject(err);
                }

            })
        })
        .catch((err)=> {
            deferred.reject(err);
        })
    return deferred.promise;
}


//-----------------------------------------------------------------------------------------------------------------
function getMembersData(eventId) {
    var deferred = q.defer();
    var conn;

    logger.info('getMembersData quering database...');
    db.getConnection()
        .then((connection) => {
            conn = connection;
            return getSqlForDataRetrive(conn, eventId);
        })
        .then((sqltext) => {
            return getMemebersListData(conn, eventId, sqltext);
        })
        .then((rows) => {
            conn.release();
            deferred.resolve(rows);
        })
        .catch((err)=> {
            if (conn)
                conn.release();
            logger.error('Error accuired while getMembersData retriving data from database');
            logger.error(err);
            deferred.reject(err);
        })

    return deferred.promise;
}

function getSqlForDataRetrive(conn, eventId) {
    var deferred = q.defer();
    conn.query("SELECT pivotsql FROM v_pivotdata WHERE eventid=?", [eventId], function (err, result) {
        if (err) {
            console.log(err);
            deferred.reject(err);
            return;
        }
        logger.debug("Pivot sql: ");
        logger.debug(result[0].pivotsql);
        deferred.resolve(result[0].pivotsql);
    })
    return deferred.promise;
}


function getMemebersListData(conn, eventId, sqltext) {
    var deferred = q.defer();

    var rows = [];
    conn.query(sqltext, [eventId], (err, result)=> {
        if (err) {
            logger.error(err);
            deferred.reject(err);
            return;
        }
        deferred.resolve(result);
    })

    return deferred.promise;
}

//-----------------------------------------------------------------------------------------------------------------