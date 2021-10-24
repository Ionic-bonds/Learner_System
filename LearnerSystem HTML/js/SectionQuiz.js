function onLoad(){
    var id = sessionStorage.setItem('SectionQuizID', 1)
    var id = 1
    var serviceURL = `http://localhost:5016/sectionquiz/${id}`
    displayEnrolledCourses(serviceURL)
}

function displaySectionQuiz(SectionQuizID){
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            retrieveSectionQuiz(this);
        }
    }
    request.open("GET", (`SectionQuiz/${SectionQuizID}`), false);
    request.setRequestHeader("Content-type", "application/json");
    request.send();
}

function retrieveSectionQuiz(obj){
    
    var response_json = JSON.parse(obj.responseText);
    var tableHtml = ``;
    var sectionList = response_json["data"]["sectionquiz"];
    console.log("===== Print section quiz =====")
    console.log(sectionList)
    sessionStorage.setItem('sectionList', sectionList)
    tableHtml += `
    <div id="layoutSidenav_content">
    <main>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Section 1 Quiz</h1>

            <br><br>
            <div class="card mb-4">
                <div><h4 class="container-fluid px-4">${sectionList[QuizQnID-1]}</h4></div>
                <div class="card-body">
                    <div id = "question1">
                        <p class="mb-0">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis ornare magna. 
                            Vestibulum neque sem, semper in mi sed, mattis laoreet justo. Praesent dictum bibendum neque in tempus. 
                            Phasellus bibendum tincidunt sem, a porttitor ligula tincidunt gravida. Nulla ac arcu erat. 
                            Quisque semper quis sem et eleifend. Etiam mollis vulputate sem. 
                            Curabitur vitae molestie justo, ac viverra nisl. Etiam laoreet eros vel pulvinar facilisis. Aliquam commodo cursus dui, vitae congue ante luctus quis. Vivamus nec ornare est, non tempus metus. In scelerisque et leo quis mattis. Phasellus non ante dolor. Pellentesque ac eros eget ex ultrices tristique sit amet vitae mi.
                        </p>
                    </div>
                        <br>
                    <div class="form-check"; style= "position:relative; left:5%">
                        <input class="form-check-input" type="radio" name="question1" id="question1">
                        <label class="form-check-label" for="flexRadioDefault1">
                        Answer 1
                        </label>
                    </div>
                    <div class="form-check"; style= "position:relative; left:5%">
                        <input class="form-check-input" type="radio" name="question1" id="question1" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                        Answer 2
                        </label>
                    </div>
                    <div class="form-check"; style= "position:relative; left:5%">
                        <input class="form-check-input" type="radio" name="question1" id="question1" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                        Answer 3
                        </label>
                    </div>
                    <div class="form-check"; style= "position:relative; left:5%">
                        <input class="form-check-input" type="radio" name="question1" id="question1" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                        Answer 4
                        </label>
                    </div>
                </div>`;
    for(element of enrolledList){
        //the code line below is to for loop to retrieve courseName using another function because right now only have courseID
        var retrieveCourseNameJURL = `http://localhost:5016/sectionoverview/${element['CourseID']}`;
    }
    document.getElementById("tablebody").innerHTML = html;
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


