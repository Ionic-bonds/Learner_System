window.onload=function(){
    displayQuizQns()
    console.log("Window on load success")
}

function displayQuizQns(QuizQnID){
    var QuizQnID = 1;
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveQuizQns(this);
            console.log("retrieve of quiz qn success")
        }
    }
    request.open("GET",'http://localhost:5016/quizquestions/' + QuizQnID, false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}


function retrieveQuizQns(obj){
    
    var response_json = JSON.parse(obj.responseText);
    console.log(response_json)
    var quiz_qnsHtml = ``;

    var quiz_questions = response_json["data"]["QuizQuestion"];
    console.log(quiz_questions)

    var quiz_option_no = response_json["data"]["QuizOptionNo"];
    console.log(quiz_option_no)

    var quiz_option = response_json["data"]["QuizOption"];
    console.log(quiz_option)
    p = 1
    for (j = 0; j < 4 ; j++ ){
        quiz_qnsHtml += `<h4>Question ${p}</h4>
        <div class="card-body">
            <p class="mb-0">
                ${quiz_questions}
            </p>
        </div>`
        for (i = 0; i < 4 ; i++ ){
            quiz_qnsHtml += `
            <div class="card-body">
                <div class="form-check"; style= "position:relative; left:5%">
                    <input class="form-check-input" type="radio" name="question${p}">
                    <label class="form-check-label" for="flexRadioDefault${p}">
                    ${quiz_option_no} : ${quiz_option}
                    </label>
                    </input>
                </div>
            </div>`
        }
        p += 1;
    }
    quiz_qnsHtml += `
    <br>
    <button type="button" class="btn btn-primary">Submit</button>`
    

    
    
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
