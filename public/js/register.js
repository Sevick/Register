/**
 * Created by S on 14.11.2016.
 */

"use strict";


function setupDoc(fieldsJSON) {
    //var testJson = '{"fields":[{"id":125,"name":"name","label":"Name","mandatory":true},{"id":123,"name":"phone","mask":"054-nnnnnn","mandatory":true},{"id":124,"name":"email","mask":"x@x.x","mandatory":true,"type":"email"}]}';
    //var routeEvent = JSON.parse(fieldsJSON);

    if (!fieldsJSON)
        return;

    var event = fieldsJSON;
    //console.log(event);
    for (var propName in event) {
        if (typeof(event[propName]) === 'string') {
            var elements = document.getElementsByClassName(propName);
            for (var elemIdx = 0; elemIdx < elements.length; elemIdx++) {
                console.log(elements.item(elemIdx));
                elements.item(elemIdx).innerText = event[propName];
            }
        }
    }

    var inputsContainer = document.getElementById('inputsContainer');
    inputsContainer.innerHTML = getInputsHTML(event.fields);
}
