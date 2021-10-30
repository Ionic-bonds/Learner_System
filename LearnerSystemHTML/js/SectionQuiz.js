window.onload=function(){
    //displayQuizQns()
    // displayUniqueQuizQns()
    var SectionQuizID = 1;
    displayQuestions(SectionQuizID);
    getDuration();
    console.log("Window on load success");

    //Quiz Timer
    var quizTiming = getDuration(SectionQuizID);
    let time_minutes = quizTiming['data']['duration']; // Value in minutes
    let time_seconds = 0; // Value in seconds

    let duration = time_minutes * 60 + time_seconds;

    element = document.querySelector('#count-down-timer');
    element.textContent = `${paddedFormat(time_minutes)}:${paddedFormat(time_seconds)}`;

    startCountDown(--duration, element);
};

//Quiz Timer
function getDuration(SectionQuizID){

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://localhost:5016/sectionquiz/${SectionQuizID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
};

function paddedFormat(num) {
    return num < 10 ? "0" + num : num; 
}

function startCountDown(duration, element) {

    let secondsRemaining = duration;
    let min = 0;
    let sec = 0;

    let countInterval = setInterval(function () {

        min = parseInt(secondsRemaining / 60);
        sec = parseInt(secondsRemaining % 60);

        element.textContent = `${paddedFormat(min)}:${paddedFormat(sec)}`;

        secondsRemaining = secondsRemaining - 1;
        if (secondsRemaining < 0) { clearInterval(countInterval) };

    }, 1000);
}


// Quiz display functions
function displayQuestions(SectionQuizID){
    console.log("in display qns");
    var num = getNumOfQns(SectionQuizID);
    var numOfQns = num['data'];
    console.log(numOfQns);

    var html = ``;

    for(let i = 1; i <= numOfQns; i++){
        var ele = getQuestions(i);
        console.log(ele);
        console.log('after ele');
        var questions = ele['data'];
        console.log(questions);
        var qnsHtml = ``;
        var optionsHtml = ``;

        for (element of questions) {
            if (element['SectionQuizID'] == SectionQuizID){
            
                if (qnsHtml == ``){
                    quizQns = element['QuizQuestion'];
                    qnsHtml += `<br><h4>Question ${i}</h4>
                    <div class="card-body">
                        <p class="mb-0">
                            ${quizQns}
                        </p>
                    </div>`;
                }

                optionsHtml += `<div class="card-body">
                <div class="form-check"; style= "position:relative; left:5%">
                    <input class="form-check-input" type="radio" name="question${i}">
                    <label class="form-check-label" for="flexRadioDefault${i}">
                    ${element['QuizOptionNo']} : ${element['QuizOption']}
                    </label>
                    </input>
                </div>
            </div>`

            console.log(qnsHtml);
            console.log(optionsHtml);
            }
        }
         
        html += qnsHtml + optionsHtml + '<br>';
        console.log(html);

    }

    html += `
    <br>
    <button type="button" class="btn btn-primary">Submit</button>`
    
    document.getElementById("QuizQns").innerHTML = html;
    
};

function getNumOfQns(SectionQuizID){

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://localhost:5016/quizquestionsNo/${SectionQuizID}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
};

function getQuestions(qnsNo){

    var xhr = new XMLHttpRequest();
    xhr.open("GET",`http://localhost:5016/quizquestions/${qnsNo}`, false);
    xhr.send();

    // stop the engine while xhr isn't done
    for(; xhr.readyState !== 4;)

    if (xhr.status === 200) {

        console.log('SUCCESS', xhr.responseText);

    } else console.warn('request_error');

    return JSON.parse(xhr.responseText);
};

// function displayQuizQns(){
//     var request = new XMLHttpRequest();
//     request.onreadystatechange = function() {
//         if (this.readyState == 4 && this.status == 200) {
//             var json_obj = JSON.parse(request.responseText);
//             retrieveQuizQns(json_obj);
//             console.log("retrieve of quiz qn success")
//         }
//     }
//     request.open("GET",'http://localhost:5016/quizquestions', false);
//     request.setRequestHeader("Content-type", "application/json");
//     request.send();
// }

// function getdisplayUniqueQuizQns() {

//     var xhr = new XMLHttpRequest();
//     xhr.open("GET",`http://localhost:5016/quizquestions/1`, false);
//     xhr.send();

//     // stop the engine while xhr isn't done
//     for(; xhr.readyState !== 4;)

//     if (xhr.status === 200) {

//         console.log('SUCCESS', xhr.responseText);

//     } else console.warn('request_error');

//     return JSON.parse(xhr.responseText);
// }

// function displayUniqueQuizQns(){
//     var id = 1
//     var request = new XMLHttpRequest();
//     request.onreadystatechange = function() {
//         if (this.readyState == 4 && this.status == 200) {
//             var json_obj = JSON.parse(request.responseText);
//             retrieveUniqueQuizQns(json_obj);
//             console.log("retrieve of Unique_quiz qn success")
//         }
//     }
//     request.open("GET",'http://localhost:5016/sectionquizquestions/' + id, false);
//     request.setRequestHeader("Content-type", "application/json");
//     request.send();
// }


// function retrieveUniqueQuizQns(json_obj){
//     console.log(json_obj)
//     var quiz_qnsHtml = ``;
//     var unique_quiz_questions = json_obj.data.quizquestionslist;
//     console.log(unique_quiz_questions)
//     p = 1
//     for (i = 0 ; i < json_obj.data.quizquestionslist.length ; i++){
//         quiz_qnsHtml += `<h4>Question ${p}</h4>
//             <div class="card-body">
//                 <p class="mb-0">
//                     ${json_obj.data.quizquestionslist[i]}
//                 </p>
//             </div>`
//     p += 1;
//     }

//     document.getElementById("QuizQns").innerHTML = quiz_qnsHtml;
    
// }


// function getCourseDetails(courseID) {

//     var xhr = new XMLHttpRequest();
//     xhr.open("GET",http://localhost:5016/getCourseName/${courseID}, false);
//     xhr.send();

//     // stop the engine while xhr isn't done
//     for(; xhr.readyState !== 4;)

//     if (xhr.status === 200) {

//         console.log('SUCCESS', xhr.responseText);

//     } else console.warn('request_error');

//     return JSON.parse(xhr.responseText);
// }



// function retrieveQuizQns(json_obj){
    
//     console.log(json_obj)
//     var quiz_qnsHtml = ``;
//     quiz_options = ``;
//     // this is same as response_json["data"]["quizquestions"]
//     var quiz_questions = json_obj.data.quizquestions;
//     console.log(quiz_questions)

//     questions = json_obj.data.quizquestions[0].QuizQnID;
//     console.log(questions);
    
//     questions_list = []
//     for(i = 0 ; i < json_obj.data.quizquestions.length ; i ++){
//         console.log("== looping ==")
//         questions_list.push(json_obj.data.quizquestions[i].QuizQuestion)
//     }

//     console.log(questions_list)
//     //===============================================
//     //unique function for qns
//     // you can leave this function here
//     function onlyUnique(value, index, self) {
//         return self.indexOf(value) === index;
//       }
      
//       var unique = questions_list.filter(onlyUnique);
      
//       console.log( "=== start of unique question in db ===")
//       console.log(unique);
//       console.log( "=== end of unique question in db ===")
    
//     p = 1
//     Qn_id = 1;
//     for(element of unique){
//         console.log(element);
//         quiz_qnsHtml += `<h4>Question ${p}</h4>
//             <div class="card-body">
//                 <p class="mb-0">
//                     ${element}
//                 </p>
//             </div>`
    
        
//     p += 1;
//     // unique function for question
//     //================================================

//         console.log("===Quiz ID ===")
//         console.log(Qn_id)  
//         i = 0;
//         // for (i = 0 ; i < json_obj.data.quizquestions.length ; i ++){
//         for (element of quiz_questions ){
//             if (json_obj.data.quizquestions[i].QuizQnID == Qn_id){
//                 // console.log("in options loop")

//                 console.log(json_obj.data.quizquestions[i].QuizOptionNo)
//                 quiz_qnsHtml += `
//                     <div class="card-body">
//                         <div class="form-check"; style= "position:relative; left:5%">
//                             <input class="form-check-input" type="radio" name="question${Qn_id}">
//                             <label class="form-check-label" for="flexRadioDefault${Qn_id}">
//                             ${json_obj.data.quizquestions[i].QuizOptionNo} : ${json_obj.data.quizquestions[i].QuizOption}
//                             </label>
//                             </input>
//                         </div>
//                     </div>`
//                     i += 1;
            
//             }
                
//             Qn_id += 1;   
//         }
//         console.log("out of 2nd loop")

            
//         // Qn_id += 1; 
        
    
//     }
    
//     quiz_qnsHtml += `
//     <br>
//     <button type="button" class="btn btn-primary">Submit</button>`
    
//     document.getElementById("QuizQns").innerHTML = quiz_qnsHtml;
//     console.log(quiz_options)
    

// }




// async function CreateSectionQuiz(obj){
//     var response_json = JSON.parse(obj.responseText);
//     var data = response_json['data']['Enrollment'][0];
//     var SectionID = data['SectionID'];
//     var SectionMaterialsID = data['SectionMaterialsID'];
//     var CourseID = data['CourseID'];
//     var quizResult = data['quizResult'];
//     var duration = data['duration'];
//     var quizStartTime = data['quizStartTime'];
//     var CourseID = data['CourseID'];


//     console.log(SectionID,SectionMaterialsID,CourseID,quizResult,duration,quizStartTime,CourseID );

//     var data = { 
//         "SectionID": SectionID, 
//         "SectionMaterialsID": SectionMaterialsID, 
//         "CourseID": CourseID, 
//         "quizResult": quizResult, 
//         "duration": duration, 
//         "quizStartTime": quizStartTime,
//         "CourseID": CourseID
//       };
//         // Change serviceURL to your own
//         var serviceURL = "http://localhost:5016/createsectionquiz";
        
//         try {
//             const response =
//                 await fetch(
//                     serviceURL, { 
//                         method: 'POST',
//                         headers: {'Accept': 'application/json','Content-Type': 'application/json', "Access-Control-Allow-Origin":"*"},
//                         body: JSON.stringify(data) 
//                     }
//                 );
//                 const result = await response.json();
//                 console.log(result);
                
//         } catch (error) {
//             // Errors when calling the service; such as network error, 
//             // service offline, etc
//             console.log("Cannot connect!");
//         } // error
// }


// async function Create_learner_quiz_answer(obj){
//     var response_json = JSON.parse(obj.responseText);
//     var data = response_json['data']['Enrollment'][0];
//     var QuizQnID = data['QuizQnID'];
//     var SectionQuizID = data['SectionQuizID'];
//     var SectionMaterialsID = data['SectionMaterialsID'];
//     var CourseID = data['CourseID'];
//     var SectionID = data['SectionID'];
//     var LearnerID = data['LearnerID'];
//     var quizAnswer = data['quizAnswer'];


//     console.log(QuizQnID,SectionQuizID,SectionMaterialsID,CourseID,SectionID,LearnerID,quizAnswer );

//     var data = { 
//         "QuizQnID": QuizQnID, 
//         "SectionQuizID": SectionQuizID, 
//         "SectionMaterialsID": SectionMaterialsID, 
//         "CourseID": CourseID, 
//         "SectionID": SectionID, 
//         "LearnerID": LearnerID,
//         "quizAnswer": quizAnswer
//       };
//         // Change serviceURL to your own
//         var serviceURL = "http://localhost:5016/createsectionquiz";
        
//         try {
//             const response =
//                 await fetch(
//                     serviceURL, { 
//                         method: 'POST',
//                         headers: {'Accept': 'application/json','Content-Type': 'application/json', "Access-Control-Allow-Origin":"*"},
//                         body: JSON.stringify(data) 
//                     }
//                 );
//                 const result = await response.json();
//                 console.log(result);
                
//         } catch (error) {
//             // Errors when calling the service; such as network error, 
//             // service offline, etc
//             console.log("Cannot connect!");
//         } // error
//     }
    

