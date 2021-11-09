var endpoint_url = '3.144.166.168'
//var endpoint_url = 'localhost';
function onLoads(){
    var id = sessionStorage.setItem('CourseID', 1)
    var id = 1
    var serviceURL = `http://${endpoint_url}:5016/retrieveSections/${id}`
    console.log('here');
    displayEnrolledCourses(serviceURL)
}
function onLoad(){
    var tableHtml = `<button type="button" class="btn btn-primary" id='View' onClick='CreateQuiz()'> Create Quizzes </button>`; 
    document.getElementById('display1').innerHTML = tableHtml;
}
function displayEnrolledCourses(url){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            //will do for a loop here to retrieve each course
            retrieveCourseNameOnly(this);
        }
    }
    //request.open("GET", (`${checkoutURL}/${LearnerID}`), false);
    request.open("GET", (`${url}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function retrieveCourseNameOnly(obj){
    var response_json = JSON.parse(obj.responseText);
    console.log(response_json)
    var data = response_json['data']['courses']
    var tableHtml = `<label for="Section"> Choose a section you want to create a quiz for: </label>
    <select name="Section" id="Section">`;
    var tableHtml2 = `<label for="Materials"> Choose the materials that you want to create a quiz for: </label>
    <select name="Materials" id="Materials">`;
    
    for(element of data){
        tableHtml += ` <option value="${element['SectionID']}">${element['SectionID']}</option>`
        tableHtml2 += ` <option value="${element['SectionMaterialsID']}"> ${element['SectionMaterialsID']}</option>`
    }
    tableHtml2 += `</select><br>`;
    tableHtml += `</select>`;
    document.getElementById('display1').innerHTML = tableHtml;
    document.getElementById('display2').innerHTML = tableHtml2;
    var sectionID = document.getElementById("Section").value
    var sectionMaterialsID = document.getElementById('Materials')
    console.log(sectionID)
    var tableHtml3 = `<button  type="button" class="btn btn-primary" id='View' onClick='CreateQuizzes(${sectionID}, ${sectionMaterialsID})'> Create Quizzes </button>`;
    document.getElementById('display3').innerHTML = tableHtml3;
}
function retrievesCourseNameOnly(obj){
    var response_json = JSON.parse(obj.responseText);
    console.log(response_json)
    var data = response_json['data']['courses']
    var tableHtml = `<label for="Section"> Choose a section you want to create a quiz for: </label>
    <select name="Section" id="Section">`;
    var tableHtml2 = `<label for="Materials"> Choose the materials that you want to create a quiz for: </label>
    <select name="Materials" id="Materials"> </br>`;
    
    for(element of data){
        tableHtml += ` <option value="${element['SectionID']}">${element['SectionID']}</option>`
        tableHtml2 += ` <option value="${element['SectionMaterialsID']}"> ${element['SectionMaterialsID']}</option>`
    }
    tableHtml2 += `</select><br>`;
    tableHtml += `</select>`;
    document.getElementById('display1').innerHTML = tableHtml;
    document.getElementById('display2').innerHTML = tableHtml2;
    var sectionID = document.getElementById("Section").value
    var sectionMaterialsID = document.getElementById('Materials')
    console.log(sectionID)
    var tableHtml3 = `<button id='View'  type="button" class="btn btn-primary" onClick='CreateQuizzes(${sectionID}, ${sectionMaterialsID})'> Create Quizzes </button>`;
    document.getElementById('display3').innerHTML = tableHtml3;
}
async function CreateQuiz(){
    var tableHtml2 = `Creating Quiz for Xerox WorkCentre 7845 for third section and third week`;

    var CourseID = 1;
    var SectionID = 3;
    var SectionMaterialsID = 7;
    var SectionQuizID = 2;
    document.getElementById('display2').innerText = tableHtml2;
    var data = {"SectionQuizID": 1, "SectionID": 3 , "CourseID":1 ,"SectionMaterialsID":3 ,"quizResult":"P" ,"duration":120 ,"quizStartTime":"12:30:50"}
    var serviceURL = `http://${endpoint_url}:5016/review/insert`;
        
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
                
        } catch (error) {
            // Errors when calling the service; such as network error, 
            // service offline, etc
            console.log("Cannot connect!");
        } // error
    click(SectionQuizID,CourseID, SectionID, SectionMaterialsID)
}
function click(SectionQuizID,CourseID, SectionID, SectionMaterialsID){
    var NumberOfQuizzes = `
    <div class="form-group row">
    <label for="questions" class="col-sm-5 col-form-label">Enter the number of questions you would like to set </label> 
    <div class="col-sm-3">
    <input type='text' id='questions' class="form-control"></input>
    </div>
    </div>

    <button type="button" class="btn btn-primary" onClick='displayRemainingQuizes(${SectionQuizID},${CourseID}, ${SectionID}, ${SectionMaterialsID})'> Submit number of questions </button>`;
    document.getElementById('display3').innerHTML = NumberOfQuizzes
}

async function displayRemainingQuizes(SectionQuizID,CourseID, SectionID, SectionMaterialsID){
    var retrievedValue = document.getElementById('questions').value
    var tableHtml = ``;
    for(let i = 0; i < retrievedValue; i++){
        tableHtml+= `Question ${i+1} <br>
        <div id='maindiv${i+1}'>
        <div class="col-sm-6 my-1">
        <input type='text' class='quizzes${i+1} form-control' id='quizzes${i+1}'></input> 
        </div>
        <input type='radio' name='options${i+1}' id='MCQ${i+1}' value='MCQ' onclick='appendbelow(${i+1})'><label for='MCQ'> MCQ </label>
        <input type='radio' name='options${i+1}' id='boolean' value='boolean' onclick="removeappend(${i+1})"  checked="checked" ><label for='boolean'> True/False </label>
        <br><br>
        </div>
        <div id='${i+1}' class='allresults${i+1}'>
        <div class="col-sm-3 my-1">
        Option <input type='text' class='results${i+1} form-control' id='results${i+1}'>
        </div>
        <div class="col-sm-3 my-1">
        Option <input type='text' class='results${i+1} form-control' id='results${i+1}'>
        </div>
        </div>
        <div>

        </div>
        </br>
        
         `;
    }
    tableHtml += `<button type="button" class="btn btn-primary" onClick='submitAllOptions(${SectionQuizID},${CourseID}, ${SectionID}, ${SectionMaterialsID}, ${retrievedValue})'> Submit to create all questions </button>`
    document.getElementById('display4').innerHTML = tableHtml;
}
function appendbelow(value){
    var appendValues = document.getElementById(value);
    
    console.log(lengthylength)
    
    var lengthylength = appendValues.getElementsByTagName('input').length
    console.log(lengthylength)
    if(lengthylength <= 2){
        var amendHtml = `<div class="col-sm-3 my-1">
        Option <input type='text' class='results${value} form-control' id='results${value}'> </div>
        <div class="col-sm-3 my-1">Option <input type='text' class='results${value} form-control' id='results${value}'> </div>
        </div>`;
    
        appendValues.insertAdjacentHTML('beforeend', amendHtml);
    }
    //var buttonsfortable = `<button  type="button" class="btn btn-primary" onClick='AddOptions(${value})'> Add Option </button>`;

}
function removeappend(value){
    var appendValues = document.getElementById(value);
    var lengthylength = appendValues.getElementsByTagName('input').length
    console.log(lengthylength)
    if(lengthylength > 2){
        var amendHtml = `<div class="col-sm-3 my-1">
        Option <input type='text' class='results${value} form-control' id='results${value}'>
        </div>
        <div class="col-sm-3 my-1">
        Option <input type='text' class='results${value} form-control' id='results${value}'>`;
        document.getElementById(value).innerHTML = amendHtml;
    }
    
    
}
function AddOptions(value){
    console.log(value)
    // Here have to dynamically increase the options
    var result = document.getElementById(`${value}`);
    var htmlTable = `<div class="col-sm-3 my-1">
    Option <input type='text' class='results${value} form-control' id='results${value}'> </div>`;
    result.insertAdjacentHTML('beforeend', htmlTable);

}
async function submitAllOptions(SectionQuizID,CourseID, SectionID, SectionMaterialsID, retrievedValue){
    var counter = 0
    console.log(SectionQuizID)
    console.log(CourseID)
    console.log(SectionID)
    console.log(SectionMaterialsID)
    
    for(let i = 0; i < retrievedValue; i++){
        counter += 1
        valuez = document.getElementById(`quizzes${i+1}`).value
        //console.log(valuez)
        retrieveAllvalues = document.getElementById(`results${i+1}`).value
        console.log(document.getElementsByClassName(`results${i+1}`))
        
        for (let item of document.getElementsByClassName(`results${i+1}`)){
            // Here i need to retrieve like for each element in result += 1
            counter += 1
            console.log("this is quizqnid" + (i+1));
            console.log("this is CourseID" + CourseID);
            console.log("this is SectionMaterialsID " + SectionMaterialsID);
            var data = {
                //edit the data here => extract the results from the textbox from previous code
                "QuizQnID": i+1, 
                "CourseID": CourseID, 
                "SectionMaterialsID": SectionMaterialsID, 
                "SectionQuizID": SectionQuizID,
                "SectionID": SectionID, 
                "QuizQuestion": document.getElementById(`quizzes${i+1}`).value, 
                "QuizOptionNo": counter, 
                "QuizOption": item.value
              };
                // Change serviceURL to your own
                var serviceURL = `http://${endpoint_url}:5016/createquizzes`;
                
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
                        confrimMessage(result);
                        
                } catch (error) {
                    // Errors when calling the service; such as network error, 
                    // service offline, etc
                    console.log("Cannot connect!");
                    confrimMessage('false');
                }
            
        }
        counter = 0;
    
        //console.log(retrieveAllvalues)
        //Here i have to make sure i retrieve all values from displayremainingquizes & then insert it directly
         // error
    }
}

function confrimMessage(success) {
    if ( (success == 'false') || (success['code'] != 201) ){
        document.getElementById("error-modal-body").innerHTML = "Cannot Connect. Try again later.";
        // document.getElementById("closeBtn").innerHTML =`<button type="button btn" class="close" data-dismiss="modal" aria-label="Close">
        // <span aria-hidden="true">&times;</span>`;
    } else {
        document.getElementById("error-modal-body").innerHTML = "Your quiz has been created.";
        document.getElementById("errorsFooter").innerHTML = `<button class="btn btnSubmit" data-dismiss="modal" id="redirectBtn" onclick="location.href='index.html';">Done</button> `;
        document.getElementById("closeBtn").innerHTML ="";
        
    }
    $('#errorModal').modal('show');
    
}
