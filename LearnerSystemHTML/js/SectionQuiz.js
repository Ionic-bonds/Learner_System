window.onload=function(){
    var id = sessionStorage.setItem('SectionQuizID', 1)
    var id = 1
    var serviceURL = `http://localhost:5016/sectionquiz/${id}`
    //displayEnrolledCourses(serviceURL)
    console.log("success")
}

function displaySectionQuiz(SectionQuizID){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveSectionQuiz(this);
        }
    }
    request.open("GET", ('http://localhost:5016/sectionquiz/' + SectionQuizID), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function displayQuizQns(QuizQnID){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveQuizQns(this);
        }
    }
    request.open("GET", ('http://localhost:5016/quizquestions/' + QuizQnID), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function retrieveSectionQuiz(obj){
    
    var response_json = JSON.parse(obj.responseText);
    var section_quizHtml = ``;
    var sectionList = response_json["data"]["sectionquiz"];
    var SectionQuizID = response_json["data"]["sectionquiz"]["SectionQuizID"]
    console.log(SectionQuizID)
    console.log(sectionList)
    sessionStorage.setItem('sectionList', sectionList)

    section_quizHtml += `
            <h1 class="mt-4">Section ${SectionQuizID} Quiz</h1>`

    for(var i=0; i< sectionList.length; i++)
	{
    section_quizHtml += `
            <br><br>
            <div class="card mb-4">
                <div><h4 class="container-fluid px-4">Question ${QuizQnID}</h4></div>
                   
                <div class="card-body">
                    <div id = "question1">
                        <p class="mb-0">
                            ${QuizQuestion}
                        </p>
                    </div>
                </div> `
    }
   
    
    document.getElementById("SectionQuiz").innerHTML = section_quizHtml;
}

function retrieveQuizQns(obj){
    
    var response_json = JSON.parse(obj.responseText);
    var quiz_qnsHtml = ``;
    var Option = response_json["data"]["quizquestions"];
    console.log(sectionList)
    sessionStorage.setItem('quizquestions', quizList)

    for(var i=0; i< quizList.length; i++)
	{
        quiz_qnsHtml += `
        <div class="form-check"; style= "position:relative; left:5%">
        <input class="form-check-input" type="radio" name="question1" id="question1">
        <label class="form-check-label" for="flexRadioDefault1">
        ${i} : ${Option}
        </label>
    </div>`
    } 
    
    document.getElementById("QuizQns").innerHTML = quiz_qnsHtml;
}




async function CreateSectionQuiz(obj){
    var response_json = JSON.parse(obj.responseText);
    var data = response_json['data']['Enrollment'][0];
    var SectionID = data['SectionID'];
    var SectionMaterialsID = data['SectionMaterialsID'];
    var CourseID = data['CourseID'];
    var quizResult = data['quizResult'];
    var duration = data['duration'];
    var quizStartTime = data['quizStartTime'];
    var CourseID = data['CourseID'];


    // var trainerstuff = getTrainerSchedule(CourseID);
    // var TrainerScheduleID = trainerstuff['data']['Enrollment'][0]['TrainerScheduleID'];

    console.log(SectionID,SectionMaterialsID,CourseID,quizResult,duration,quizStartTime,CourseID );

    var data = { 
        "SectionID": SectionID, 
        "SectionMaterialsID": SectionMaterialsID, 
        "CourseID": CourseID, 
        "quizResult": quizResult, 
        "duration": duration, 
        "quizStartTime": quizStartTime,
        "CourseID": CourseID
      };
        // Change serviceURL to your own
        var serviceURL = "http://localhost:5016/createsectionquiz";
        
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
}


async function Create_learner_quiz_answer(obj){
    var response_json = JSON.parse(obj.responseText);
    var data = response_json['data']['Enrollment'][0];
    var QuizQnID = data['QuizQnID'];
    var SectionQuizID = data['SectionQuizID'];
    var SectionMaterialsID = data['SectionMaterialsID'];
    var CourseID = data['CourseID'];
    var SectionID = data['SectionID'];
    var LearnerID = data['LearnerID'];
    var quizAnswer = data['quizAnswer'];


    console.log(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,LearnerID,quizAnswer );

    var data = { 
        "QuizQnID": QuizQnID, 
        "SectionQuizID": SectionQuizID, 
        "SectionMaterialsID": SectionMaterialsID, 
        "CourseID": CourseID, 
        "SectionID": SectionID, 
        "LearnerID": LearnerID,
        "quizAnswer": quizAnswer
      };
        // Change serviceURL to your own
        var serviceURL = "http://localhost:5016/createsectionquiz";
        
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
}


