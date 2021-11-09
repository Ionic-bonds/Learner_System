import os
from os import path
import PersonClass
from PersonClass import *

def configure_routes(app):

    @app.route('/')
    def hello_world():
        return 'Hello, World!'

    @app.route('/enrollment', methods=['GET']) 
    def enrollment(): 
        enrollmentRecords = Enrollment.query.all() 
        print("in enrolment func")
        print(enrollmentRecords)
        if (enrollmentRecords): 
            return 'Ok', 200
        else:
            return 'Bad Request', 400

    @app.route('/getEnrollment/<int:EnrollmentID>', methods=['GET']) 
    def getEnrollment(EnrollmentID): 
        enrollmentRecords = Enrollment.query.filter_by(EnrollmentID=EnrollmentID).all() 
        if (enrollmentRecords): 
            return 'Ok', 200
        else:
            return 'Bad Request', 400 

    @app.route('/insertSelfEnrol', methods=['POST']) 
    def insertSelfEnrol(): 
        LearnerID = request.get_json()["LearnerID"]
        CourseID = request.get_json()["CourseID"]
        ClassID = request.get_json()["ClassID"]
        Approved= request.get_json()["Approved"]
        passPrerequisite = request.get_json()["passPrerequisite"]

        selfEnrol = Enrollment(LearnerID=LearnerID, EnrollmentID=None, CourseID=CourseID,ClassID=ClassID,Approved=Approved,passPrerequisite=passPrerequisite)
    
        try:
            db.session.add(selfEnrol)
            db.session.commit()

            return 'Ok', 200

        except Exception as e:
            return e, 500

    @app.route('/learner/<int:LearnerID>') 
    def learner_by_id(LearnerID): 
        learnerDetails = Learner.query.filter_by(LearnerID=LearnerID).all() 
        if learnerDetails: 
            return jsonify( 
                { 
                    "code": 200, 
                    "data": { 
                        "Learner":  [learners.json() for learners in learnerDetails]  
                    } 
                } 
            ) 
        if (learnerDetails): 
            return 'Ok', 200
        else:
            return 'Bad Request', 400 

    @app.route("/learnerDetails/<int:LearnerID>") 
    def retrievelearnerDetails(LearnerID): 
        data = db.session.query(Person, Learner)\
        .filter(
        (Learner.LearnerID == LearnerID)
        & (Learner.PersonID==Person.PersonID)
        & (Person.PersonID==Learner.PersonID)
        ).first()

        if (data): 
            return 'Ok', 200
        else:
            return 'Bad Request', 400



    @app.route("/sectionquiz") 
    def retrieveSectionQuiz(): 
        SectionQuizList = SectionQuiz.query.all()
        if len(SectionQuizList): 
            return jsonify( 
                { 
                    "code": 200, 
                    "data": { 
                        "sectionquiz": [sectionquiz.json() for sectionquiz in SectionQuizList] 
                    } 
                } 
            ) 
        return jsonify( 
            { 
                "code": 404, 
                "message": "No sectionquiz available." 
            } 
        ), 404 

    @app.route("/quizquestions") 
    def retrieveQuizQn(): 
        QuizQnList = QuizQn.query.all()
        if len(QuizQnList): 
            return jsonify( 
                { 
                    "code": 200, 
                    "data": { 
                        "quizquestions": [quizquestions.json() for quizquestions in QuizQnList] 
                    } 
                } 
            ) 
        return jsonify( 
            { 
                "code": 404, 
                "message": "No sectionquiz available." 
            } 
        ), 404 
    
    @app.route("/quizquestions/<int:QuizQnID>")
    def find_by_QuizQuestions(QuizQnID):
        quizquestions = QuizQn.query.filter_by(QuizQnID=QuizQnID).all()
        if quizquestions:
            return jsonify(
                {
                    "code": 200,
                    "data": [quizquestions.json() for quizquestions in quizquestions] 
                }
            )
        return jsonify(
            {
                "code": 404,
                "message": "quizquestions not found."
            }
        ), 404

    @app.route("/courseoverview") 
    def retrieveCourseName(): 
        CourseList = CourseOverview.query.all() 
        if len(CourseList): 
            return jsonify( 
                { 
                    "code": 200, 
                    "data": { 
                        "courses": [courses.json() for courses in CourseList] 
                    } 
                } 
            ) 
        return jsonify( 
            { 
                "code": 404, 
                "message": "No enrollment available for selected student." 
            } 
        ), 404 

    @app.route("/courseoverview/<int:CourseID>") 
    def retrieveCourseOverview(CourseID): 
        CourseList = CourseOverview.query.filter_by(CourseID=CourseID).all() 
        if len(CourseList): 
            return jsonify( 
                { 
                    "code": 200, 
                    "data": { 
                        "courses": [courses.json() for courses in CourseList] 
                    } 
                } 
            ) 
        return jsonify( 
            { 
                "code": 404, 
                "message": "No enrollment available for selected student." 
            } 
        ), 404

    @app.route("/sectionmaterials") 
    def retrieveSectionMaterials(): 
        SectionList = SectionMaterials.query.all() 
        if len(SectionList): 
            return jsonify( 
                { 
                    "code": 200, 
                    "data": { 
                        "courses": [sections.json() for sections in SectionList] 
                    } 
                } 
            ) 
        return jsonify( 
            { 
                "code": 404, 
                "message": "No section materials available for selected student." 
            } 
        ), 404 
    
    @app.route('/courserecord', methods=['GET']) 
    def courserecord(): 
        courseRecords = CourseRecord.query.all() 
        if (courseRecords): 
            return 'Ok', 200
        else:
            return 'Bad Request', 400

    @app.route('/courserecord/<int:CourseID>', methods=['GET']) 
    def getCourserecordbyID(CourseID): 
        courseRecords = CourseRecord.query.filter_by(CourseID=CourseID).all() 
        if (courseRecords): 
            return 'Ok', 200
        else:
            return 'Bad Request', 400

    @app.route("/trainerschedule/<int:CourseID>") 
    def retrieveTrainerSchedule(CourseID): 
        schedule = TrainerSchedule.query.filter_by(CourseID=CourseID).all() 
        if len(schedule): 
            return jsonify( 
                { 
                    "code": 200, 
                    "data": { 
                        "trainerschedules": [x.json() for x in schedule] 
                    } 
                } 
            ) 
        return jsonify( 
            { 
                "code": 404, 
                "message": "No schedule available for selected course." 
            } 
        ), 404
