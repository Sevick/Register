/**
 * Created by S on 09.11.2016.
 */

module.exports = Log;

function Log(){
    return {
        log: log,
    }
}

function log(stuff) {
    console.log(stuff);
}