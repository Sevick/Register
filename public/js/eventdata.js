/**
 * Created by S on 01.12.2016.
 */


function setupEventData(eventdata) {
    var eventId = eventdata.id;

    console.log(eventdata.dt);

    var eventDt = new Date(eventdata.dt);
    var regEndDt = new Date(eventdata.regend);
    var eventImgsList = eventdata.imgslist;
    var eventImgs;
    if (!eventImgsList) {
        eventImgs = [];
    }
    else {
        eventImgs = eventImgsList.split('|').map((img,imgIdx)=> window.location.origin+'/event/image?id=' + eventId + '&img=' + img);
    }

    var eventInfo = eventdata.info;

    $("#eventDate").html(eventDt.toLocaleDateString() + "&nbsp&nbsp" + eventDt.toLocaleTimeString());
    $("#regEndDate").html(regEndDt.toLocaleDateString() + "&nbsp&nbsp" + regEndDt.toLocaleTimeString());
    $("#eventVacancies").html(eventdata.vacancies);
    $("#eventInfo").html(eventdata.info);

    for (var imgIdx in eventImgs) {
        addImg(eventImgs[imgIdx], imgIdx);
    }

    if (eventImgs.length < 1) {
        $('#eventImgs').hide();
    }

    function addImg(path, count) {
        //console.log('addImg: ' + path + "  count=" + count);
        var imgTemplate = '<div class="item %ACTIVE% carouselItem" id="imgTemplate"><img src="%IMGSRC%" alt="Second slide"></div>';
        var imgHTML = imgTemplate.replace("%IMGSRC%", path);
        imgHTML = count == 0 ? imgHTML.replace('%ACTIVE%', 'active') : imgHTML.replace('%ACTIVE%', '');
        $('#carouselItems').append(imgHTML);
    }
}
