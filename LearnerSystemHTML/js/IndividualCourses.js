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

    sectionQuizMaterials = retrieveSectionMaterialsByCourseID(CourseID);
    sectionMaterials = retrieveSectionMaterialsCourse(CourseID);

    console.log(sectionQuizMaterials['data']);
    console.log(sectionMaterials['data']);
    var quizData = sectionQuizMaterials['data']['courses'];
    var materialsData = sectionMaterials['data']['courses'];
    // const index = data.map(e => e.SectionID).indexOf(1);
    // console.log(index);

    for(element of courseList){
        
        sectionID = element['SectionID'];
        console.log(sectionID);

        console.log(getAllIndexes(quizData,sectionID));
        console.log(getAllIndexes(materialsData,sectionID));
        count += 1
        tableHtml += `
        <div class="card">
            <div class="card-header" id="heading${count}">
                <h5 class="mb-0">&#10004;
                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapse${count}" aria-expanded="true" aria-controls="collapse${count}">
                        Section ${count}
                    </button>
                </h5>
            </div>
            
            <div id="collapse${count}" class="collapse" aria-labelledby="heading${count}" data-parent="#accordion">
                <div class="card-body">
                    <table class="table">
                        <thead>
                            <tr>   
                                <td> ${element['SectionDescription']} </td>
                            </tr>
                        </thead>
                        <tbody>
            `;

        for (index of getAllIndexes(materialsData,sectionID)) {

                    tableHtml += `
                            <tr>
                                <th scope="row">
                                <div style="display: block">
                                <p style="display: inline-block; float: left"> Title placeholder</p>
                                    <div class="sectionmaterials${sectionID}"  style="display: inline-block; float: right">
                                        <a href="materialsData[${index}]["SectionMaterials"]">View Course Materials</a>
                                    </div>
                                </div>
                                </th>
                            </tr>
        `;

        }

        tableHtml += `
                            <tr>
                                <td>
                                    <a class="btn btn-primary" href="#" role="button">Quiz placeholder</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>`;
        
    }
    document.getElementById('tableretrieve').innerHTML = tableHtml;
    //appendTable(tableHtml, CourseID);
}

function retrieveSectionMaterialsByCourseID(CourseID) {

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://localhost:5016/retrieveSectionMaterialsByCourseID/${CourseID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
};

function retrieveSectionMaterialsCourse(CourseID) {

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://localhost:5016/sectionmaterialsbyCourse/${CourseID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
};

function getAllIndexes(arr, val) {
    var indexes = [];
    console.log("in get indexes")
    for (var i = 0; i < arr.length; i++) {
        if (arr[i].SectionID == val) {
            indexes.push(i);
            //console.log(i);
        }
  }
  return indexes;
}
// function search(source, searchItem) {
//     var results;

//     //name = name.toUpperCase();
//     results = source.filter(function(entry) {
//         return entry.includes(searchItem);
//     });
//     return results;
// }


// function appendTable(tableHtml, CourseID){
//     var url = `http://localhost:5016/retrieveSectionMaterialsByCourseID/${CourseID}`;
//     var request = new XMLHttpRequest();
//     request.onreadystatechange = function() {
//         if (this.readyState == 4 && this.status == 200) {
//             //will do for a loop here to retrieve each course
//             appendTables(this, tableHtml, CourseID);
//         }
//     }
//     //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
//     request.open("GET", (`${url}`), false);
//     request.setRequestHeader("Content-type", "application/json");
//     request.send();
// }
// function appendTables(obj, tableHtml, CourseID){
//     var response_json = JSON.parse(obj.responseText);
//     var courseList = response_json["data"]["courses"];
//     //below code is for retrieval of the sectionID for the sectionquiz and the duration of the quiz and the quiz start time
//     //<tr><th scope="row"> Videos => Replace it with ${element['name']} <- to retrieve the name of the section materials
//     // ^ have to include in new SQL with the added 'name' variable inside sectionmaterials
//     for(element of courseList){
//         tableHtml += `
//                             <tr>
//                                 <th scope="row"> Videos </th>
//                                 <td> Duration ${element['duration']} </td> 
//                                 <td> &#10004;</td> 
//                             </tr>

//                             <tr>
//                                 <th scope="row">
//                                     <div id="SectionQuiz">
//                                         <a href="quiz.html?=${element['SectionID']}">Section Quiz</a>
//                                     </div>
//                                 </th>
//                             </tr>

//                             <tr>
//                                 <th scope="row">
//                                     <td> Start Time: ${element['quizStartTime']} </td>
//                                 </th>
//                             </tr>
//         `;
//     }
//     document.getElementById('tableretrieve').innerHTML = tableHtml;
//     sectionMaterialsCourse(CourseID, tableHtml);
//     //need to retrieve deadline & sectionquiz from another function using flask app route => sectionmaterialsbyCourse/courseid
// }
// function sectionMaterialsCourse(CourseID, tableHtml){
//     var url = `http://localhost:5016/sectionmaterialsbyCourse/${CourseID}`;
//     var request = new XMLHttpRequest();
//     request.onreadystatechange = function() {
//         if (this.readyState == 4 && this.status == 200) {
//             //will do for a loop here to retrieve each course
//             newappendTables(this, tableHtml);
//         }
//     }
//     //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
//     request.open("GET", (`${url}`), false);
//     request.setRequestHeader("Content-type", "application/json");
//     request.send();
// }
// function newappendTables(obj, tableHtml){
//     var response_json = JSON.parse(obj.responseText);
//     var courseList = response_json["data"]["courses"];
                                         
//     for(element of courseList){
//         //this is for retrieving of the url from sectionmaterials variable
//         tableHtml += `
//                             <tr>
//                                 <td>
//                                     <a class="btn btn-primary" href="${element['SectionMaterials']}" role="button">View section materials</a>
//                                 </td>
//                             </tr>
//                         </tbody>
//                     </table>
//                 </div>
//             </div>
//         </div>`;
//     }
//     tableHtml += `</table>`;
//     document.getElementById('tableretrieve').innerHTML = tableHtml;
// }
