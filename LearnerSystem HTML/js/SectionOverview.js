function onLoad(){
    var id = sessionStorage.getItem('SectionID')
    var id = 1
    var serviceURL = `http://localhost:5016/sectionoverview/${id}`
    displaySectionOverview(id)
}

function retrieveCourseNameOnly(obj, CourseID, CourseProgress){
    var response_json = JSON.parse(obj.responseText);
    var incomplete_courses = response_json["data"]["courses"]
    var incompleteTable = ``;
    for (element of incomplete_courses){
        incompleteTable += `<div> ${element['CourseName']}
        ${CourseProgress} <button id='CourseName' onClick='ViewCourse()'> View Course </div>`;
    }
    document.getElementById('status').innerHTML = incompleteTable;
}

function displayEnrolledCourses(checkoutURL){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveAllCourses(this);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${checkoutURL}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();

function retrieveAllSections(obj){ 
    var response_json = JSON.parse(obj.responseText);
    console.log(response_json)
    var tableHtml = ``;
    var enrolledList = response_json["data"]["courses"];
    console.log(enrolledList)
    sessionStorage.setItem('enrolledList', enrolledList)
    count = 0;
    tableHtml += `<div>`
    for(element of enrolledList){
        count+=1
        tableHtml += `<div class="col-xl-3 col-md-6"><div class="card-body"> Course Name: ${element['SectionName']}<div id='retrieveAll${count}'></div> </div>
        <div class="card-footer d-flex align-items-center justify-content-between">
        <a class="small text-white stretched-link" href='course-overview.html?CourseID=${element['SectionID']}'>View Details</a>
        <div class="small text-white"><i class="fas fa-angle-right"></i></div></div></div></div>`;
        console.log(element['SectionDescription'])
        //the code line below is to for loop to retrieve courseName using another function because right now only have courseID   
        LearnerID = sessionStorage.getItem('LearnerID')
        sessionStorage.setItem('LearnerID', LearnerID)
        displayIndividualSections(LearnerID, tableHtml, count);
        console.log("display here")
    }

function displayIndividualSections(SectionID){
    var retrieveCourseNameJURL = `http://localhost:5016/retrieveAllSections/`+ SectionID;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveIndividualCourses(this, tableHtml, count, LearnerID);
        }
    }
    request.open("GET", retrieveCourseNameJURL , false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function retrieveIndividualSections(obj, tableHtml,count, SectionID){
    console.log(SectionID)
    var response_json = JSON.parse(obj.responseText);
    var courseName = response_json["data"]["courses"];
    var newTableHtml = ``;
    tableHtml += `</div>`;
    document.getElementById('Section1Description').innerHTML = tableHtml; 
    document.getElementById(`retrieveAll${count}`).innerHTML = newTableHtml
    retrievePrequisiteCourses(SectionID);     
}

function retrieveSectionProgress(url){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            sectionprogress(this);
        }
    }
    //request.open("GET", (`${checkoutURL}/${SectionID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();

