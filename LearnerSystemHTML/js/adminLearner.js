var endpoint_url = '3.144.166.168'
window.onload=function(){
    console.log("in onload");
    sessionStorage.setItem('CourseID',1);
    sessionStorage.setItem('ClassID',1);
    displayEnrollment();
    console.log("testing jenkins");
};

function displayEnrollment(){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveAllEnrollment(this);
        }
    }
    request.open("GET", `http://${endpoint_url}:5016/courserecord/1`, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrieveAllEnrollment(obj){
    
    var response_json = JSON.parse(obj.responseText);
    var enrollmentList = response_json["data"]["CourseRecords"];
    // sessionStorage.setItem('enrolledList', enrolledList)
    // tableHtml += `<div>Course Name</div>`;
    var learnerIDs = [];
    var html = ``;
    for(element of enrollmentList){
        if (element['ClassID'] == sessionStorage.getItem('ClassID')) {
        var LearnerID = element['LearnerID'];
        learnerIDs.push(LearnerID);
        var CourseRecordID = element['CourseRecordID'];
        
        var details = getLearnerDetails(LearnerID);
        //console.log(details);

        var courseID = element['CourseID'];
        var courseDetails = getCourseDetails(courseID);
        var courseName = courseDetails['data']['CourseOverview'][0]['CourseName'];

        var name = details['data']['name'];
        var email = details['data']['Email'];

        html += `
        <tr class="alert" role="alert" id="${CourseRecordID}">
        <td>
        </td>
        <td class=" align-items-center">
        <div class="pl-3 email" id="details">
          <span>${name}</span>
          <span>${email}</span>
        </div>
        </td>
        <td>${element['ClassID']}</td>
        <td>${courseName}</td>
        <td>${element['CourseProgress']}</td>
        <td>${element['FinalQuizResult']}</td>
        </tr>`;
        }

        
    }
    document.getElementById("tablebody").innerHTML = html;
    addLearners(learnerIDs);

}

async function addLearners(learnerIDs){
    var data = {
        "ID": learnerIDs
    };
    console.log(data);
    var serviceURL = `http://${endpoint_url}:5016/getCourseRecords`;
        
        try {
            const response =
                await fetch(
                    serviceURL, { 
                        method: 'POST',
                        headers: {'Accept': 'application/json','Content-Type': 'application/json', "Access-Control-Allow-Origin":"http://3.144.166.168/:5016/getCourseRecords"},
                        body: JSON.stringify(data) 
                    }
                );
                const result = await response.json();
                console.log("addLearners function");
                console.log(result);
                displayLearners(result);
                
        } catch (error) {
            // Errors when calling the service; such as network error, 
            // service offline, etc
            console.log("Cannot connect!");
        } // error
};

function displayLearners(result){
    learners = result['data']['Learners']; 
    var html = ``;
    for (learner of learners){
        learnerID = learner['LearnerID'];
        personID = learner['PersonID'];
        var details = getPersonDetails(personID);
        console.log(details);
        var name = details['data']['Person'][0]['name'];
        var email = details['data']['Person'][0]['Email'];
        html += `<tr class="alert" role="alert" id="${learnerID}">
        <td>
        </td>
        <td>
        <div class="pl-3 email" id="details">
          <span>${name}</span>
          <span>${email}</span>
        </div>
        </td>
        <td><button type="button" class="btn btn-primary" data-dismiss="modal" value="${learnerID}" onclick="addLearner(this.value)">Add</button></td>
    </tr>`
        
    }

    document.getElementById('learnerTable').innerHTML = html;
}

async function addLearner(learnerID) {
    courseID = sessionStorage.getItem('CourseID');
    classID = sessionStorage.getItem('ClassID');
    var trainerstuff = getTrainerSchedule(courseID);
    var TrainerScheduleID = trainerstuff['data']['Enrollment'][0]['TrainerScheduleID'];

    var data = { 
        "CourseID": courseID, 
        "TrainerScheduleID": TrainerScheduleID, 
        "LearnerID": learnerID, 
        "ClassID": classID, 
        "CourseProgress": 0, 
        "FinalQuizResult": "NA"
      };
        // Change serviceURL to your own
        var serviceURL = `http://${endpoint_url}:5016/insertCourseRecord`;
        
        try {
            const response =
                await fetch(
                    serviceURL, { 
                        method: 'POST',
                        headers: {'Accept': 'application/json','Content-Type': 'application/json', "Access-Control-Allow-Origin":"*"},
                        body: JSON.stringify(data) 
                    }
                );
                const result = await response.json();
                console.log(result);
                window.location.reload();
                        
        } catch (error) {
            // Errors when calling the service; such as network error, 
            // service offline, etc
            console.log("Cannot connect!");
        } // error
    
};

function getTrainerSchedule(CourseID) {

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://${endpoint_url}:5016/trainerSchedule/${CourseID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
}


function getPersonDetails(personID) {

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://${endpoint_url}:5016/person/${personID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
}

function getCourseDetails(courseID) {

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://${endpoint_url}:5016/getCourseName/${courseID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
}

function getLearnerDetails(LearnerID) {

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://${endpoint_url}:5016/learnerDetails/${LearnerID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
}
