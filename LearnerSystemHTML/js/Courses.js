

function onLoad(){
    var id = sessionStorage.setItem('LearnerID', 1)
    var id = 1
    var serviceURL = `http://localhost:5016/individualcourse/${id}`
    displayAllcourses();
    displayEnrolledCourses(serviceURL);
    
}
function displayAllcourses(){
    var url = `http://localhost:5016/courseoverview`;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log("entered here line 16");
            //will do for a loop here to retrieve each course
            all(this);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}
function all(obj){
    var response_json = JSON.parse(obj.responseText);
    var incomplete_courses = response_json["data"]["courses"]
    var tableHtml = `<div class='row'>`;
    var counter = 0;
    for(element of incomplete_courses){
        counter+= 1;
        console.log(element['CourseID'])
        tableHtml += `
        <div class="col-sm-4">
        <div class="card m-2 p-2">
        <div class="card-body">
        <h5 class="card-title">${element['CourseName']}</h5>
        <img class="card-img-top img-fluid rounded-top" src="./Courses_images/image${counter}.jpg" alt="Image" width="250" height="300"> <br>
        </br>
        <a class="card-text" href='course-overview.html?CourseID=${element['CourseID']}'>View Details</a>
        </div></div></div>
        </br>`;
    }
    document.getElementById('retrieveCourses').innerHTML = tableHtml;
}
function onLoadingDashboard(){
    var id = sessionStorage.setItem('LearnerID', 1)
    var LearnerID = sessionStorage.getItem(LearnerID)

    LearnerID = 1;
    console.log(LearnerID)
}
function retrieveAllCoursesByValue(value){
    var LearnerID = sessionStorage.getItem('LearnerID')
    progressurl = `http://localhost:5016/retrievecompletedcourse/`+ LearnerID;
    completedurl = `http://localhost:5016/retrieveinprogress/`+ LearnerID;
    incompleteurl = `http://localhost:5016/retrieveincomplete` + LearnerID
    if(value == 2){
        retrieveProgress(progressurl);
        
    }
    else if(value == 3){
        //tomorrow create this function
        retrieveONlyCompleted(completedurl)
    }
    else if(value == 1){
//need to do incomplete
        retrieveInComplete(incompleteUrl)
    }
}
function retrieveInComplete(url){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            incompleteindividualprogress(this);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}
//need to do this here
function incompleteindividualprogress(obj){

}
function retrieveProgress(url){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            individualprogress(this);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}
function individualprogress(obj){
    //this function here is for value == 2 => incomplete status
    var response_json = JSON.parse(obj.responseText);
    var incomplete_courses = response_json["data"]["courses"]
    var incompleteTable = ``;
    for (element of incomplete_courses){
        var CourseID = element['CourseID'];
        retrieveCourseOverview(CourseID, element['CourseProgress']);
    }
}
function retrieveCourseOverview(CourseID, CourseProgress){
    var retrieveCourseNameUrl = `http://localhost:5016/retrieveinprogress/` + CourseID
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveCourseNameOnly(this, CourseID, CourseProgress);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${retrieveCourseNameUrl}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function retrieveCourseNameOnly(obj, CourseID, CourseProgress){
    var response_json = JSON.parse(obj.responseText);
    var incomplete_courses = response_json["data"]["courses"]
    var incompleteTable = ``;
    for (element of incomplete_courses){
        incompleteTable += `<div> ${element['CourseName']}
        ${CourseProgress} <button id='View' onClick='ViewCourse()'> View Course </div>`;
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
}
function retrieveAllCourses(obj){
    
    var response_json = JSON.parse(obj.responseText);
    console.log(response_json)
    var tableHtml = ``;
    var enrolledList = response_json["data"]["courses"];
    console.log(enrolledList)
    sessionStorage.setItem('enrolledList', enrolledList)
    count = 0;
    tableHtml += `<div class='row'>`
    for(element of enrolledList){
        console.log(element['CourseID'])
        count+=1
        tableHtml += `
        <div class="col-sm-4">
        <div class="card m-2 p-2">
        <div class="card-body">
        <h5 class="card-title">${element['CourseName']}</h5>
        <img class="card-img-top img-fluid rounded-top" src="./Courses_images/image${count}.jpg" alt="Image"> <br>
        </br>
        <a class="card-text" href='course-overview.html?CourseID=${element['CourseID']}'>View Details</a>
        </div></div></div>`;
        //<div> Course Description: ${element['CourseDescription']} </div>
        //<div id='retrieveAll${count}'>
        //</div>`;
        console.log(element['CourseDescription'])
        //the code line below is to for loop to retrieve courseName using another function because right now only have courseID   
        LearnerID = sessionStorage.getItem('LearnerID')
        sessionStorage.setItem('LearnerID', LearnerID)
        //displayIndividualCourses(LearnerID, tableHtml, count);
        console.log("display here")
    }
    tableHtml += `</div>`;
    document.getElementById('insertion').innerHTML = tableHtml; 
    document.getElementById(`retrieveAll${count}`).innerHTML = newTableHtml;
    var LearnerID = sessionStorage.getItem('LearnerID')
    retrievePrequisiteCourses(LearnerID); 

}
function displayIndividualCourses(LearnerID, tableHtml, count){
    var retrieveCourseNameJURL = `http://localhost:5016/retrieveCourseProgress/`+ LearnerID;
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

//function retrieveIndividualCourses(obj, tableHtml,count, LearnerID){
  //  console.log(LearnerID)
   // var response_json = JSON.parse(obj.responseText);
   // var courseName = response_json["data"]["courses"];
    //var newTableHtml = ``;
    //for(element of courseName){
        //newTableHtml += `<div> Progress: ${element['CourseProgress']}</div>`;
    //}
    //tableHtml += `</div>`;
    
     
    
//}
//Retrieve individual available courses by LearnerID according to satisfied pre-requisite
function retrievePrequisiteCourses(LearnerID){
    var retrieveCourseNameJURL = `http://localhost:5016/prereq/`+ LearnerID;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            returnArray(this);
        }
    }
    request.open("GET", retrieveCourseNameJURL , false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}    

function returnArray(obj){
    var response_json = JSON.parse(obj.responseText);
    console.log(response_json)
    var tableHtml = ``;
    var enrolledList = response_json["data"]["courses"];
    for(element of enrolledList){
        console.log(element)
        SatisfiedCourseID = element['MainCourseID'];
        retrieveIndividualCourses(SatisfiedCourseID);
    }
    
function retrieveIndividualCourses(CourseID){
    var retrieveCourseNameJURL = `http://localhost:5016/retrieveCourseNameByCourseID/`+ CourseID;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveIndividualCourseNameByID(this);
        }
    }
    request.open("GET", retrieveCourseNameJURL , false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function retrieveIndividualCourses(CourseID){
    var retrieveCourseNameJURL = `http://localhost:5016/retrieveCourseNameByCourseID/`+ CourseID;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveIndividualCourseNameByID(this);
        }
    }
    request.open("GET", retrieveCourseNameJURL , false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}
//Retrieve all eligible courses for user
function retrieveIndividualCourseNameByID(obj){
    var response_json = JSON.parse(obj.responseText);
    var courseList = response_json["data"]["courses"];
    var NewesttableHtml = ``;

    for(element of courseList){
        console.log(element['CourseID']);
        NewesttableHtml += `<div class="col-xl-6 col-md-6 d-flex">
        <img src="./Courses_images/software engineering.jfif' class="card-img-top" alt="...">
        <div class="card-body">
        <h5 class="card-title">${element['CourseName']}</h5>
        <p class="card-text">${element['CourseDescription']}</p>
        <div class="Medium text-white">
        <a class="small text-white stretched-link" href="course-overview.html?CourseID=${element['CourseID']}">View Details</a>
        <i class="fas fa-angle-right"></i></div></div>
        </div>
        `;
    }
    document.getElementById('prereq').innerHTML = NewesttableHtml
}

}




