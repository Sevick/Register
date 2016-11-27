/**
 * Created by S on 15.11.2016.
 */

"use strict";


var inputFieldTemplate = '<div class="form-group"><label for="%NAME%">%LABEL%</label><input type="%TYPE%" class="form-control" id="%NAME%" name="%NAME%" %REQUIRED%  maxlength="%MAXLENGTH%"></div>';

const defaultMaxLength=50;

function getInputsHTML(fields){
    var inputs = "";
    if (fields) {
        var fi
        for (var fieldIdx in fields) {
            var newInput=inputFieldTemplate;
            newInput=newInput.replace(/%NAME%/g, fields[fieldIdx].id);
            newInput=newInput.replace(/%TYPE%/g, fields[fieldIdx].type || 'text');
            newInput=newInput.replace(/%LABEL%/g, fields[fieldIdx].label || capitalizeFirstLetter(fields[fieldIdx].name));
            newInput=newInput.replace(/%REQUIRED%/g, fields[fieldIdx].mandatory ? 'required="true"' : '');
            newInput=newInput.replace(/%MAXLENGTH%/g, fields[fieldIdx].maxlen || defaultMaxLength);
            inputs+=newInput;
        }
    }
    return inputs;
}


function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}

function redirect (url) {
    var ua        = navigator.userAgent.toLowerCase(),
        isIE      = ua.indexOf('msie') !== -1,
        version   = parseInt(ua.substr(4, 2), 10);

    // Internet Explorer 8 and lower
    if (isIE && version < 9) {
        var link = document.createElement('a');
        link.href = url;
        document.body.appendChild(link);
        link.click();
    }

    // All other browsers can use the standard window.location.href (they don't lose HTTP_REFERER like Internet Explorer 8 & lower does)
    else {
        window.location.href = url;
    }
}