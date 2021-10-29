window.onload=function(){
    displayQuizQns()
    console.log("Window on load success")
}

function displayQuizQns(){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var json_obj = JSON.parse(request.responseText);
            retrieveQuizQns(json_obj);
            console.log("retrieve of quiz qn success")
        }
    }
    request.open("GET",'http://localhost:5016/quizquestions', false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}


function retrieveQuizQns(json_obj){
    
    console.log(json_obj)
    var quiz_qnsHtml = ``;
    quiz_options = ``;
    // this is same as response_json["data"]["quizquestions"]
    var quiz_questions = json_obj.data.quizquestions;
    console.log(quiz_questions)

    questions = json_obj.data.quizquestions[0].QuizQnID;
    console.log(questions);
    
    questions_list = []
    for(i = 0 ; i < json_obj.data.quizquestions.length ; i ++){
        console.log("== looping ==")
        questions_list.push(json_obj.data.quizquestions[i].QuizQuestion)
    }

    console.log(questions_list)
    //===============================================
    //unique function for qns
    // you can leave this function here
    function onlyUnique(value, index, self) {
        return self.indexOf(value) === index;
      }
      
      var unique = questions_list.filter(onlyUnique);
      
      console.log(unique);
    
    p = 1
    for(element of unique){
        // console.log(element);
        quiz_qnsHtml += `<h4>Question ${p}</h4>
            <div class="card-body">
                <p class="mb-0">
                    ${element}
                </p>
            </div>`
    p += 1;

    // unique function for question
    //================================================
    
    console.log(json_obj.data.quizquestions[0].QuizQnID)
        j = 0
        for (i = 0 ; i < json_obj.data.quizquestions.length ; i ++){
            if (json_obj.data.quizquestions[i].QuizQnID != j){
                j += 1;
            }
            else{
                    quiz_qnsHtml += `
                        <div class="card-body">
                            <div class="form-check"; style= "position:relative; left:5%">
                                <input class="form-check-input" type="radio" name="question${p}">
                                <label class="form-check-label" for="flexRadioDefault${p}">
                                ${json_obj.data.quizquestions[j].QuizOptionNo} : ${json_obj.data.quizquestions[j].QuizOption}
                                </label>
                                </input>
                            </div>
                        </div>`
            
            }
        }
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
