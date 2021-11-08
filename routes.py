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

    # @app.route('/learner/<int:LearnerID>') 
    # def learner_by_id(LearnerID): 
    #     learnerDetails = Learner.query.filter_by(LearnerID=LearnerID).all() 
    #     if learnerDetails: 
    #         return jsonify( 
    #             { 
    #                 "code": 200, 
    #                 "data": { 
    #                     "Learner":  [learners.json() for learners in learnerDetails]  
    #                 } 
    #             } 
    #         ) 
    #     return jsonify( 
    #             return 'Ok', 200
    #     ), 404 