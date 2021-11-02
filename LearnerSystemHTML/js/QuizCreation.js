function onLoads(){
    var id = sessionStorage.setItem('CourseID', 1)
    var id = 1
    var serviceURL = `http://localhost:5016/retrieveSections/${id}`
    console.log('here');
    displayEnrolledCourses(serviceURL)
}
function onLoad(){
    var tableHtml = `<button id='View' onClick='CreateQuiz()'> Create Quizzes </button>`; 
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
    var tableHtml3 = `<button id='View' onClick='CreateQuizzes(${sectionID}, ${sectionMaterialsID})'> Create Quizzes </button>`;
    document.getElementById('display3').innerHTML = tableHtml3;
}
function retrievesCourseNameOnly(obj){
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
    var tableHtml3 = `<button id='View' onClick='CreateQuizzes(${sectionID}, ${sectionMaterialsID})'> Create Quizzes </button>`;
    document.getElementById('display3').innerHTML = tableHtml3;
}
async function CreateQuiz(){
    var tableHtml2 = `Creating Quiz for Xerox WorkCentre 7845 for third section and third week`;

    var CourseID = 1;
    var SectionID = 3;
    var SectionMaterialsID = 3;
    var SectionQuizID = 1;
    document.getElementById('display2').innerText = tableHtml2;
    var data = {"SectionQuizID": 1, "SectionID": 3 , "CourseID":1 ,"SectionMaterialsID":3 ,"quizResult":"P" ,"duration":120 ,"quizStartTime":"12:30:50"}
    var serviceURL = "http://localhost:5016/review/insert";
        
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
    var NumberOfQuizzes = `Enter the number of questions you would like to set <input type='text' id='questions'></input><br>
    <button onClick='displayRemainingQuizes(${SectionQuizID},${CourseID}, ${SectionID}, ${SectionMaterialsID})'> Submit number of questions </button>`;
    document.getElementById('display3').innerHTML = NumberOfQuizzes
}
async function displayRemainingQuizes(SectionQuizID,CourseID, SectionID, SectionMaterialsID){
    var retrievedValue = document.getElementById('questions').value
    var tableHtml = ``;
    for(let i = 0; i < retrievedValue; i++){
        tableHtml+= `Question ${i+1} <br>
        <div id='maindiv${i+1}'>
        <input type='text' class='quizzes${i+1}' id='quizzes${i+1}'></input> <br>
        <input type='radio' name='options${i+1}' id='MCQ' value='MCQ'><label for='MCQ'> MCQ </label>
        <input type='radio' name='options${i+1}' id='boolean' value='boolean'><label for='boolean'> True/False </label>
        <br><br>
        </div>
        <div id='${i+1}' class='allresults${i+1}'>
        Option <input type='text' class='results${i+1}' id='results${i+1}'>
        <br><br>
        Option <input type='text' class='results${i+1}' id='results${i+1}'>
        <br><br>
        </div>
        <div>
        <button onClick='AddOptions(${i+1})'> Add Option </button>
        </div>
        
         `;
    }
    tableHtml += `<button onClick='submitAllOptions(${SectionQuizID},${CourseID}, ${SectionID}, ${SectionMaterialsID}, ${retrievedValue})'> Submit to create all questions </button>`
    document.getElementById('display4').innerHTML = tableHtml;
}
function AddOptions(value){
    console.log(value)
    // Here have to dynamically increase the options
    var result = document.getElementById(`${value}`);
    var htmlTable = `Option <input type='text' class='results${value}' id='results${value}'> <br><br>`;
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
                var serviceURL = "http://localhost:5016/createquizzes";
                
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
                }
            
        }
        counter = 0;
    
        //console.log(retrieveAllvalues)
        //Here i have to make sure i retrieve all values from displayremainingquizes & then insert it directly
         // error
    }
}

