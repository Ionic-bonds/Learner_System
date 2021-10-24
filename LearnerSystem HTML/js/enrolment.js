window.onload=function(){
    console.log("in onload");
    displayCourseDescription();
    getTrainerID();
    getPrerequisiteID();
    getEnrolment();
};

function displayCourseDescription(){
    var courseID = 1;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveCourseDescription(this);
        }
    }
    request.open("GET", 'http://localhost:5016/courseoverview/'+courseID, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrieveCourseDescription(obj){
    
    var response_json = JSON.parse(obj.responseText);
    var courseDescription = response_json["data"]["courses"][0]["CourseDescription"];
    var courseTitle = response_json["data"]["courses"][0]["CourseName"]
    // console.log(courseDescription);
    // sessionStorage.setItem('enrolledList', enrolledList)
    // tableHtml += `<div>Course Name</div>`;
    var html = `<p class="card-text">${courseDescription}</p>`;

    var html1 = `<h1 class="mt-4">Course Title: ${courseTitle}</h1>`

    document.getElementById("courseDescription").innerHTML = html;
    document.getElementById("courseTitle").innerHTML = html1;

}







function getTrainerID(){
    var courseID = 1;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveTrainerID(this);
        }
    }
    request.open("GET", 'http://localhost:5016/trainerschedule/'+courseID, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrieveTrainerID(obj){
    var response_json = JSON.parse(obj.responseText);
    var trainerID = response_json["data"]["trainerschedules"][0]["TrainerID"]
    console.log(trainerID);
    getPersonID(trainerID);
}

function getPersonID(trainerID){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrievePersonID(this);
        }
    }
    request.open("GET", 'http://localhost:5016/trainer/'+trainerID, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrievePersonID(obj){
    var response_json = JSON.parse(obj.responseText);
    var personID = response_json["data"]["trainers"][0]["PersonID"]
    console.log(personID)
    getPersonName(personID)
}

function getPersonName(personID){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrievePersonName(this);
        }
    }
    request.open("GET", 'http://localhost:5016/person/'+personID, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrievePersonName(obj){
    var response_json = JSON.parse(obj.responseText);
    var personName = response_json["data"]["Person"][0]["name"]
    console.log(personName)
    document.getElementById("trainerName").innerText = "Course Trainer: "+personName;
}









function getPrerequisiteID(){
    var courseID = 1;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrievePrerequisiteID(this);
        }
        else {
            document.getElementById("prerequisiteName").innerText = "Course Pre-requisite: None";
        }
    }
    request.open("GET", 'http://localhost:5016/prerequisite/'+courseID, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrievePrerequisiteID(obj){
    var response_json = JSON.parse(obj.responseText);
    var prerequisiteID = response_json["data"]["trainers"][0]["PrerequisiteCourseID"]
    // console.log(prerequisiteID)
    getPrerequisiteName(prerequisiteID)
}

function getPrerequisiteName(prerequisiteID){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrievePrerequisiteName(this);
        }
    }
    request.open("GET", 'http://localhost:5016/courseoverview/'+prerequisiteID, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrievePrerequisiteName(obj){
    var response_json = JSON.parse(obj.responseText);
    var prerequisiteName = response_json["data"]["courses"][0]["CourseName"]
    // console.log(prerequisiteName)
    document.getElementById("prerequisiteName").innerText = "Course Pre-requisite: "+prerequisiteName;
}






function getEnrolment(){
    var courseID = 1;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveEnrolment(this, courseID);
        }
    }
    request.open("GET", 'http://localhost:5016/enrollment', false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrieveEnrolment(obj, courseID){
    var response_json = JSON.parse(obj.responseText);
    var enrolment = response_json["data"]["Enrollment"]
    console.log(enrolment);
    var count = 0
    for(var i = 0; i < enrolment.length; i++) {
        console.log(enrolment[i]["ClassID"]);
        if (enrolment[i]["ClassID"] == courseID) {
            count += 1
        }
    }
    document.getElementById("enrolmentCount").innerText = `${count}/50 enrolled`;
}