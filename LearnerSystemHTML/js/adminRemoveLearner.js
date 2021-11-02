var endpoint_url = '3.144.166.168'
window.onload=function(){
    console.log("in onload");
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
    request.open("GET", `http://${endpoint_url}:5016/courserecord`, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrieveAllEnrollment(obj){
    
    var response_json = JSON.parse(obj.responseText);
    var enrollmentList = response_json["data"]["CourseRecords"];
    // sessionStorage.setItem('enrolledList', enrolledList)
    // tableHtml += `<div>Course Name</div>`;
    var html = ``;
    for(element of enrollmentList){

        var LearnerID = element['LearnerID'];
        var CourseRecordID = element['CourseRecordID'];
        
        var details = getLearnerDetails(LearnerID);
        console.log(details);

        var courseID = element['CourseID'];
        var courseDetails = getCourseDetails(courseID);
        var courseName = courseDetails['data']['CourseOverview'][0]['CourseName'];

        var name = details['data']['name'];
        var email = details['data']['Email'];

        // Action
        // sendRequest(LearnerID, function(result){
        // console.log(result['data']);


        html += `
        <tr class="alert" role="alert" id="${CourseRecordID}">
        <td>
        <label class="checkbox-wrap checkbox-primary">
              <input type="checkbox" value="${CourseRecordID}">
              <span class="checkmark"></span>
            </label>
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
    document.getElementById("tablebody").innerHTML = html;

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

function removeLearners(){
    console.log("remove learners");
    var markedCheckbox = document.querySelectorAll('input[type="checkbox"]:checked');
    courseRecordID = [];
    for (var checkbox of markedCheckbox) {
        console.log(checkbox.value);
        courseRecordID.push(checkbox.value);
         
    }
    removeRecord(courseRecordID);  
}

async function removeRecord(courseRecordID){
    var data = {
        "ID": courseRecordID
    };
    console.log(data);
    var serviceURL = `http://${endpoint_url}:5016/removeCourseRecords`;
        
        try {
            const response =
                await fetch(
                    serviceURL, { 
                        method: 'POST',
                        headers: {'Accept': 'application/json','Content-Type': 'application/json', "Access-Control-Allow-Origin":"http://localhost:5016/removeCourseRecords"},
                        body: JSON.stringify(data) 
                    }
                );
                const result = await response.json();
                console.log(result);
                
        } catch (error) {
            // Errors when calling the service; such as network error, 
            // service offline, etc
            console.log("Cannot connect!");
        } // error
}
