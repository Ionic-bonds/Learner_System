function onLoad(){
    var CourseID = sessionStorage.getItem('CourseID')
    var CourseID = 1
    retrieveIndividualCoursesByCourseID(CourseID)
    retrieveAllSectionsByCourseID(CourseID)
}

function retrieveIndividualCoursesByCourseID(CourseID){
    var url = `http://localhost:5016/retrieveCoursesID/${CourseID}`;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveAllCourses(this);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function retrieveAllCourses(obj){
    var response_json = JSON.parse(obj.responseText);
    var courseList = response_json["data"]["courses"];
    for(element of courseList){
        document.getElementById('CourseName').innerHTML = element['CourseName']
        document.getElementById('course-description').innerHTML = element['CourseDescription']
    }
    
}
function retrieveAllSectionsByCourseID(CourseID){
    var url = `http://localhost:5016/retrieveSectionsByID/${CourseID}`;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveSectionsByID(this, CourseID);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}
function retrieveSectionsByID(obj, CourseID){

    var response_json = JSON.parse(obj.responseText);
    var courseList = response_json["data"]["courses"];
    var tableHtml = ``;
    var count = 0;

    for(element of courseList){
        count += 1
        tableHtml += `<div class="card"><div id="collapse${count}" class="collapse show" aria-labelledby="heading${count}" data-parent="#accordion">
        <div class="card-body"></div>
        <table><thead><tr><th scope="col">${element['SectionID']} </th></tr>
        <tr><td> ${element['SectionDescription']} </td> <td> Section Progress: ${element['SectionProgress']}</td></tr>`;
    }
    appendTable(tableHtml, CourseID);
}
function appendTable(tableHtml, CourseID){
    var url = `http://localhost:5016/retrieveSectionMaterialsByCourseID/${CourseID}`;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            appendTables(this, tableHtml, CourseID);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}
function appendTables(obj, tableHtml, CourseID){
    var response_json = JSON.parse(obj.responseText);
    var courseList = response_json["data"]["courses"];
    //below code is for retrieval of the sectionID for the sectionquiz and the duration of the quiz and the quiz start time
    //<tr><th scope="row"> Videos => Replace it with ${element['name']} <- to retrieve the name of the section materials
    // ^ have to include in new SQL with the added 'name' variable inside sectionmaterials
    for(element of courseList){
        tableHtml += `<tr><th scope="row"> Videos </th><td> Duration ${element['duration']} </td> <td> &#10004;</td> </tr>
        <tr><th scope="row"><div id="Section1Quiz"><a href="quiz.html?=${element['SectionID']}">Section Quiz</a></div></th>
        <tr><th scope="row"><td> Start Time: ${element['quizStartTime']} </td></tr>
        `;
    }
    document.getElementById('tableretrieve').innerHTML = tableHtml;
    sectionMaterialsCourse(CourseID, tableHtml);
    //need to retrieve deadline & sectionquiz from another function using flask app route => sectionmaterialsbyCourse/courseid
}
function sectionMaterialsCourse(CourseID, tableHtml){
    var url = `http://localhost:5016/sectionmaterialsbyCourse/${CourseID}`;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            newappendTables(this, tableHtml);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}
function newappendTables(obj, tableHtml){
    var response_json = JSON.parse(obj.responseText);
    var courseList = response_json["data"]["courses"];
                                         
    for(element of courseList){
        //this is for retrieving of the url from sectionmaterials variable
        tableHtml += `</div></div><tr><td><br><a class="btn btn-primary" href="${element['SectionMaterials']}" role="button">View section materials</a></div></td></tr>
        </tbody>`;
    }
    tableHtml += `</table>`;
    document.getElementById('tableretrieve').innerHTML = tableHtml;
}
