/**
 * Created by S on 09.11.2016.
 */
var log4js = require('log4js');


exports.getLogger = getLogger;
function getLogger(modulename){
  return log4js.getLogger(modulename);
}


