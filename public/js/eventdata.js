/**
 * Created by S on 01.12.2016.
 */


function setupEventData(eventdata) {


    var eventId = eventdata.id;
    var eventDt = new Date(eventdata.dt);
    var regEndDt = new Date(eventdata.regend);
    var eventImgsList = eventdata.imgslist;
    var eventImgs = eventImgsList.split('|');
    if (eventImgsList===""){
        eventImgs = [];
    }

    var eventInfo= eventdata.info;

    $("#eventDate").html(eventDt.toLocaleDateString() + "&nbsp&nbsp" + eventDt.toLocaleTimeString());
    $("#regEndDate").html(regEndDt.toLocaleDateString() + "&nbsp&nbsp" + regEndDt.toLocaleTimeString());
    $("#eventVacancies").html(eventdata.vacancies);
    $("#eventInfo").html(eventdata.info);
    
    console.log(eventImgs);
    
    var imgTemplate = '<img src="%IMGSRC%" class="img-responsive center-block">';

/*
    if (eventImgs && eventImgs.length > 0) {
        var imgHTML = imgTemplate.replace("%IMGSRC%", 'http://localhost:3001/event/image?id=' + eventId + '&img=' + eventImgs[0]);
        console.log(imgHTML);
        $("#eventImgs").html(imgHTML);
    }
*/


}