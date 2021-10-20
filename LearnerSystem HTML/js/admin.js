window.onload=function(){
    console.log("in onload");
    displayEnrollment();
};

function displayEnrollment(){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveAllEnrollment(this);
        }
    }
    request.open("GET", 'http://localhost:5016/enrollment', false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

async function retrieveAllEnrollment(obj){
    
    var response_json = JSON.parse(obj.responseText);
    var enrollmentList = response_json["data"]["Enrollment"];
    // sessionStorage.setItem('enrolledList', enrolledList)
    // tableHtml += `<div>Course Name</div>`;
    var html = ``;
    for(element of enrollmentList){

        var LearnerID = element['LearnerID'];

        //console.log(element);
        var approval = element['Approved'];
        if (approval == false) {
            var status = `<span class="waiting">Waiting</span>`;
            var button = `<button type="button" class="btn btn-success btn-sm" style="display:block;" value="${LearnerID}" onclick="Approve(this.value)" id="Btn${LearnerID}">Approve</button>
            </br>
            <button type="button" class="btn btn-danger btn-sm" style="display:block;" value="LearnerID${LearnerID}">Remove</button>`;
        } else {
            var status = `<span class="active" >Approved</span>`;
            var button = `
						<button type="button" class="btn btn-danger btn-sm" style="display:block;" value="LearnerID${LearnerID}">Remove</button>`;
        }

        if (element['passPrerequisite'] == false) {
            var passPrerequisite = "No";
        } else {
            var passPrerequisite = "Yes";
        }
        
        var details = getLearnerDetails(LearnerID);
        console.log(details)

        var name = details['data']['name'];
        var email = details['data']['Email'];

        // Action
        // sendRequest(LearnerID, function(result){
        // console.log(result['data']);


        html += `
        <tr class="alert" role="alert" id="${LearnerID}">
        <td>
        <label class="checkbox-wrap checkbox-primary">
              <input type="checkbox" value="LearnerID${LearnerID}">
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
        <td>Course Name Loren Ipsum</td>
        <td>${passPrerequisite}</td>
        <td class="status" id="Status${LearnerID}">${status}</td>
        <td>
            ${button}
        </button>
        </td>
        </tr>`;

        
    }
    document.getElementById("tablebody").innerHTML = html;

}


function getLearnerDetails(LearnerID) {

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://localhost:5016/learnerDetails/${LearnerID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
}

function Approve(button) {
    LearnerID = button
    console.log(LearnerID);
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            UpdateTableApproval(LearnerID);
        }
    }
    request.open("GET", `http://localhost:5016/updateEnrollment/${LearnerID}`, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function UpdateTableApproval(LearnerID){
    var myobj = document.getElementById(`Btn${LearnerID}`);
    myobj.remove();

    document.getElementById(`Status${LearnerID}`).innerHTML = `<span class="active">Approved</span>`;
    
}