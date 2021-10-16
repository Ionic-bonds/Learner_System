import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from sqlalchemy.sql import expression
from datetime import datetime
import json
from os import environ

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('dbURL') or 'mysql+mysqlconnector://root@localhost:3306/LearnerSystem'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {'pool_recycle': 299}

db = SQLAlchemy(app)
CORS(app)


class Person(db.Model):
    __tableName__ = 'person'
    PersonID = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    NRIC = db.Column(db.String(100), nullable=False)
    ContactNo = db.Column(db.Integer, nullable=False)
    email = db.Column(db.String(100),nullable=False)
    __mapper_args__ = {'polymorphic_on': PersonID}

    def __init__(self, PersonID, name, NRIC,ContactNo,email):
        self.PersonID = PersonID
        self.name = name
        self.NRIC = NRIC
        self.ContactNo = ContactNo
        self.email = email

    # def json(self):
    #     return {'PersonID': self.PersonID,'name': self.name,'NRIC': self.NRIC,'ContactNo': self.ContactNo,'email': self.ContactNo}
    def json(self):
        dataTable = {
            'PersonID': self.PersonID,
            'name': self.name,
            'NRIC': self.NRIC,
            'ContactNo': self.ContactNo,
            'Email': self.email
        }
        dataTable['TrainerList'] = []
        for element in self.TrainerList:
            dataTable['TrainerList'].append(element.json())
        return dataTable

class Trainer(Person):
    __tableName__ = 'Trainer'
    __mapper_args__ = {'polymorphic_identity': 'trainer'}
    PersonID = db.Column(db.ForeignKey('person.PersonID'), nullable=False)
    TrainerID = db.Column(db.Integer, primary_key=True)

    def __init__(self, PersonID, TrainerID):
        self.PersonID = PersonID
        self.TrainerID = TrainerID
    #Trainer = db.relationship('Person', primaryjoin='trainer.PersonID == person.PersonID', backref='person')
    person = db.relationship(Person, backref='trainer')
        
    def json(self):
        return {'TrainerID': self.TrainerID,'PersonID': self.PersonID}

class Learner(Person):
    __tableName__ = 'Learner'
    __mapper_args__ = {'polymorphic_identity': 'learner'}
    PersonID = db.Column(db.ForeignKey('person.PersonID'), nullable=False, primary_key=False)
    LearnerID = db.Column(db.Integer, primary_key=True)
    
    def __init__(self, PersonID, LearnerID):
        self.PersonID = PersonID
        self.LearnerID = LearnerID

    #Learner = db.relationship('Learner', primaryjoin='learner.PersonID == person.PersonID', backref='person')
    person = db.relationship(Person, backref='learner')

    def json(self):
        return {'LearnerID': self.LearnerID, 'PersonID':self.PersonID}


class CourseOverview(db.Model):
    __tableName__ = 'CourseOverview'
    __mapper_args__ = {'polymorphic_identity': 'CourseOverview'}
    CourseID = db.Column(db.Integer, primary_key=True)
    CourseName = db.Column(db.String(100), nullable=False)
    CourseDescription = db.Column(db.String(100), nullable=False)
    CourseStatus = db.Column(db.Boolean, nullable=False)

    def __init__(self, CourseID, CourseName,CourseDescription,CourseStatus ):
        self.CourseID = CourseID
        self.CourseName = CourseName
        self.CourseDescription = CourseDescription
        self.CourseStatus = CourseStatus

    def json(self):
        return {'CourseID': self.CourseID, 'CourseName':self.CourseName , 'CourseDescription':self.CourseDescription ,'CourseStatus':self.CourseStatus }


class CoursePrerequisite(db.Model):
    __tableName__ = 'CoursePrerequisite'
    __mapper_args__ = {'polymorphic_identity': 'CoursePrerequisite'}
    MainCourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)
    PrerequisiteCourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)

    def __init__(self, MainCourseID, PrerequisiteCourseID):
        self.MainCourseID = MainCourseID
        self.PrerequisiteCourseID = PrerequisiteCourseID
    
    CourseOverview = db.relationship('CourseOverview', primaryjoin='CoursePrerequisite.MainCourseID == CourseOverview.CourseID', backref='CoursePrerequisite')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='CoursePrerequisite.PrerequisiteCourseID == CourseOverview.CourseID', backref='CoursePrerequisite')

    #courseoverview = db.relationship(CourseOverview, backref='courseprerequisite')

    def json(self):
        return {'MainCourseID': self.MainCourseID, 'PrerequisiteCourseID':self.PrerequisiteCourseID }


class SectionOverview(db.Model):
    __tableName__ = 'SectionOverview'
    __mapper_args__ = {'polymorphic_identity': 'SectionOverview'}
    SectionID = db.Column(db.Integer, primary_key=True)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)
    SectionDescription = db.Column(db.String(10000), nullable=False)
    SectionProgress = db.Column(db.Float(precision=2),nullable=False)

    #SectionOverview = db.relationship('SectionOverview', primaryjoin='sectionoverview.CourseID == courseoverview.CourseID', backref='courseoverview')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='SectionOverview.CourseID == CourseOverview.CourseID', backref='SectionOverview')

    def json(self):
        return {'SectionID': self.SectionID, 'CourseID':self.CourseID , 'SectionDescription':self.SectionDescription ,'SectionProgress':self.SectionProgress }

class SectionMaterials(db.Model):
    __tableName__ = 'SectionMaterials'
    __mapper_args__ = {'polymorphic_identity': 'SectionMaterials'}
    SectionMaterialsID = db.Column(db.Integer, primary_key=True)
    SectionID = db.Column(db.ForeignKey(SectionOverview.SectionID), nullable=False, primary_key=True)
    SectionMaterials = db.Column(db.String(10000), nullable=False)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)
    # SectionDescription = db.Column(db.String(100), nullable=False)
    # SectionProgress = db.Column(db.Float(precision=2),nullable=False)

    #SectionMaterials = db.relationship('SectionMaterials', primaryjoin='sectionmaterial.SectionID == sectionoverview.SectionID', backref='sectionoverview')
    #SectionMaterials = db.relationship('SectionMaterials', primaryjoin='sectionmaterial.CourseID == courseoverview.CourseID', backref='courseoverview')

    SectionOverview = db.relationship('SectionOverview', primaryjoin='SectionMaterials.SectionID == SectionOverview.SectionID', backref='SectionMaterials')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='SectionMaterials.CourseID == CourseOverview.CourseID', backref='SectionMaterials')

    def json(self):
        return {'SectionMaterialsID': self.SectionMaterialsID, 'SectionID':self.SectionID , 'SectionMaterials':self.SectionMaterials ,'CourseID':self.CourseID }


class SectionQuiz(db.Model):
    __tableName__ = 'SectionQuiz'
    __mapper_args__ = {'polymorphic_identity': 'SectionQuiz'}
    SectionQuizID = db.Column(db.Integer, primary_key=True)
    SectionID = db.Column(db.ForeignKey(SectionOverview.SectionID), nullable=False, primary_key=True)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)
    SectionMaterialsID = db.Column(db.Integer, primary_key=True)
    quizType = db.Column(db.String(1), nullable=False)
    quizResult = db.Column(db.Integer, primary_key=True)
    duration = db.Column(db.Integer, primary_key=True)
    quizStartTime = db.Column(db.DateTime, nullable=False)

    #SectionMaterials = db.relationship('SectionQuiz', primaryjoin='sectionquiz.SectionMaterialsID == sectionmaterials.SectionMaterialsID', backref='sectionmaterials')
    #SectionMaterials = db.relationship('SectionQuiz', primaryjoin='sectionquiz.SectionID == sectionoverview.SectionID', backref='sectionoverview')
    #SectionMaterials = db.relationship('SectionQuiz', primaryjoin='sectionquiz.CourseID == courseoverview.CourseID', backref='courseoverview')

    SectionOverview = db.relationship('SectionOverview', primaryjoin='SectionQuiz.SectionID == SectionOverview.SectionID', backref='SectionQuiz')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='SectionQuiz.CourseID == CourseOverview.CourseID', backref='SectionQuiz')

    def json(self):
        return {'SectionQuizID': self.SectionQuizID, 'SectionID':self.SectionID , 'CourseID':self.CourseID ,'SectionMaterialsID':self.SectionMaterialsID ,'quizType':self.quizType ,'quizResult':self.quizResult ,'duration':self.duration ,'quizStartTime':self.quizStartTime }


class TrainerSchedule(db.Model):
    __tableName__ = 'TrainerSchedule'
    __mapper_args__ = {'polymorphic_identity': 'TrainerSchedule'}
    TrainerID = db.Column(db.ForeignKey(Trainer.TrainerID), nullable=False, primary_key=False)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False)
    TrainerScheduleID = db.Column(db.Integer,nullable=False, primary_key=True)

    #TrainerSchedule = db.relationship('TrainerSchedule', primaryjoin='trainerschedule.TrainerID == trainer.TrainerID', backref='trainer')
    #TrainerSchedule = db.relationship('TrainerSchedule', primaryjoin='trainerschedule.CourseID == courseoverview.CourseID', backref='courseoverview')

    Trainer = db.relationship('Trainer', primaryjoin='TrainerSchedule.TrainerID == Trainer.TrainerID', backref='TrainerSchedule')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='TrainerSchedule.CourseID == CourseOverview.CourseID', backref='TrainerSchedule')


    def json(self):
        return {'TrainerID': self.TrainerID, 'CourseID':self.CourseID , 'TrainerScheduleID':self.TrainerScheduleID}


class ClassDescription(db.Model):
    __tableName__ = 'ClassDescription'
    __mapper_args__ = {'polymorphic_identity': 'ClassDescription'}
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)
    ClassID = db.Column(db.Integer,nullable=False, primary_key=True)
    ClassSize = db.Column(db.Integer, nullable=False)
    StartTime = db.Column(db.DateTime, nullable=False)
    StartDate = db.Column(db.DateTime, nullable=False)
    EndTime = db.Column(db.DateTime, nullable=False)
    EndDate = db.Column(db.DateTime, nullable=False)

    #ClassDescription = db.relationship('ClassDescription', primaryjoin='classdescription.CourseID == courseoverview.CourseID', backref='courseoverview')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='ClassDescription.CourseID == CourseOverview.CourseID', backref='ClassDescription')

   
    def json(self):
        return {'CourseID': self.CourseID, 'ClassID':self.ClassID , 'ClassSize':self.ClassSize, 
                'StartTime':self.StartTime,'StartDate':self.StartDate,'EndTime':self.EndTime,'EndDate':self.EndDate}

class CourseRecord(db.Model):
    __tableName__ = 'CourseRecord'
    __mapper_args__ = {'polymorphic_identity': 'CourseRecord'}
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False)
    #added Courserecord ID here
    CourseRecordID = db.Column(db.Integer,nullable=False, primary_key=True)
    TrainerScheduleID = db.Column(db.ForeignKey(TrainerSchedule.TrainerScheduleID), nullable=False, primary_key=True)
    LearnerID = db.Column(db.ForeignKey(Learner.LearnerID), nullable=False, primary_key=True)
    ClassID = db.Column(db.ForeignKey(ClassDescription.ClassID), nullable=False, primary_key=True)
    CourseProgress = db.Column(db.Float)
    FinalQuizResult = db.Column(db.String(100))

    #Here got issue => Need to use CourseRecord then join into TrainerSchedule table to Trainer & Trainschedule to courseoverview in 1 line
    #CourseRecord = db.relationship('trainer', primaryjoin='trainerschedule.TrainerID == trainer.TrainerID', backref='TrainerSchedule')
    #CourseRecord = db.relationship('courseoverview', primaryjoin='trainerschedule.CourseID == courseoverview.CourseID', backref='TrainerSchedule')

    CourseOverview = db.relationship('CourseOverview', primaryjoin='CourseRecord.CourseID == CourseOverview.CourseID', backref='CourseRecord')
    TrainerSchedule = db.relationship('TrainerSchedule', primaryjoin='CourseRecord.TrainerScheduleID == TrainerSchedule.TrainerScheduleID', backref='CourseRecord')
    Learner = db.relationship('Learner', primaryjoin='CourseRecord.LearnerID == Learner.LearnerID', backref='CourseRecord')
    ClassDescription = db.relationship('ClassDescription', primaryjoin='CourseRecord.ClassID == ClassDescription.ClassID', backref='CourseRecord')

    def json(self):
        return {'CourseID': self.CourseID, 'CourseRecordID': self.CourseRecordID, 'TrainerScheduleID':self.TrainerScheduleID , 'LearnerID':self.LearnerID, 'ClassID':self.ClassID}



class Enrollment(db.Model):
    __tableName__ = 'Enrollment'
    __mapper_args__ = {'polymorphic_identity': 'Enrollment'}
    LearnerID = db.Column(db.ForeignKey(Learner.LearnerID), nullable=False)
    EnrollmentID = db.Column(db.Integer,nullable=False, primary_key=True)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False)
    ClassID = db.Column(db.ForeignKey(ClassDescription.ClassID), nullable=False)
    Approved = db.Column(db.Boolean, nullable=False)
    passPrerequisite = db.Column(db.Boolean, nullable=False)

    #Enrollment = db.relationship('Enrollment', primaryjoin='enrollment.LearnerID == learner.LearnerID', backref='learner')
    #Enrollment = db.relationship('Enrollment', primaryjoin='enrollment.CourseID == courseoverview.CourseID', backref='courseoverview')
    #Enrollment = db.relationship('Enrollment', primaryjoin='enrollment.ClassID == classdescription.ClassID', backref='classdescription')

    CourseOverview = db.relationship('CourseOverview', primaryjoin='Enrollment.CourseID == CourseOverview.CourseID', backref='Enrollment')
    Learner = db.relationship('Learner', primaryjoin='Enrollment.LearnerID == Learner.LearnerID', backref='Enrollment')
    ClassDescription = db.relationship('ClassDescription', primaryjoin='Enrollment.ClassID == ClassDescription.ClassID', backref='Enrollment')


    def json(self):
        return {'LearnerID': self.LearnerID, 'LearnerRecordID': self.LearnerRecordID, 'CourseID': self.CourseID, 'ClassID': self.ClassID,
        'Approved' :self.Approved, 'passPrerequisite': self.passPrerequisite}



#Here probably have the same issue as the codes above
class QuizQn(db.Model):
    __tableName__ = 'QuizQn'
    __mapper_args__ = {'polymorphic_identity': 'QuizQn'}
    QuizQnID = db.Column(db.Integer,nullable=False, primary_key=True)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False)
    SectionMaterialsID = db.Column(db.ForeignKey(SectionMaterials.SectionMaterialsID), nullable=False)
    SectionQuizID = db.Column(db.ForeignKey(SectionQuiz.SectionQuizID), nullable=False)
    SectionID = db.Column(db.ForeignKey(SectionOverview.SectionID), nullable=False)
    QuizQuestion = db.Column(db.String(10000), nullable=False)
    QuizOptionNo = db.Column(db.Integer, nullable=False)
    QuizOption = db.Column(db.String(100), nullable=False)

    #QuizQn = db.relationship('QuizQn', primaryjoin='QuizQn.CourseID == courseoverview.CourseID', backref='courseoverview')
    #QuizQn = db.relationship('QuizQn', primaryjoin='QuizQn.SectionMaterialsID == sectionoverview.SectionMaterialsID', backref='sectionoverview')
    #QuizQn = db.relationship('QuizQn', primaryjoin='QuizQn.SectionQuizID == sectionoverview.SectionQuizID', backref='sectionoverview')
    #QuizQn = db.relationship('QuizQn', primaryjoin='QuizQn.SectionID == sectionoverview.SectionID', backref='sectionoverview')

    CourseOverview = db.relationship('CourseOverview', primaryjoin='QuizQn.CourseID == CourseOverview.CourseID', backref='QuizQn')
    SectionMaterials = db.relationship('SectionMaterials', primaryjoin='QuizQn.SectionMaterialsID == SectionMaterials.SectionMaterialsID', backref='QuizQn')
    SectionQuiz = db.relationship('SectionQuiz', primaryjoin='QuizQn.SectionQuizID == SectionQuiz.SectionQuizID', backref='QuizQn')
    SectionOverview = db.relationship('SectionOverview', primaryjoin='QuizQn.SectionID == SectionOverview.SectionID', backref='QuizQn')

    def json(self):
        return {'CourseID': self.CourseID, 'SectionMaterialsID':self.SectionMaterialsID, 'SectionQuizID':self.SectionQuizID, 'SectionID':self.SectionID}

class LearnerQuizAnswer(db.Model):
    __tableName__ = 'LearnerQuizAnswer'
    __mapper_args__ = {'polymorphic_identity': 'LearnerQuizAnswer'}
    QuizQnID = db.Column(db.ForeignKey(QuizQn.QuizQnID),nullable=False, primary_key=True)
    SectionQuizID = db.Column(db.ForeignKey(SectionQuiz.SectionQuizID), nullable=False, primary_key=True)
    SectionMaterialsID = db.Column(db.ForeignKey(SectionMaterials.SectionMaterialsID), nullable=False, primary_key=True)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)
    SectionID = db.Column(db.ForeignKey(SectionOverview.SectionID), nullable=False, primary_key=True)
    LearnerID = db.Column(db.ForeignKey(Learner.LearnerID), nullable=False, primary_key=True)
    quizAnswer = db.Column(db.String(10000), nullable=False)

    #LearnerQuizAnswer = db.relationship('LearnerQuizAnswer', primaryjoin='learnerquizanswer.CourseID == courseoverview.CourseID', backref='courseoverview')
    #LearnerQuizAnswer = db.relationship('LearnerQuizAnswer', primaryjoin='learnerquizanswer.QuizQnID == sectionoverview.QuizQnID', backref='sectionoverview')
    #LearnerQuizAnswer = db.relationship('LearnerQuizAnswer', primaryjoin='learnerquizanswer.SectionQuizID == sectionoverview.SectionQuizID', backref='sectionoverview')
    #LearnerQuizAnswer = db.relationship('LearnerQuizAnswer', primaryjoin='learnerquizanswer.SectionID == sectionoverview.SectionID', backref='sectionoverview')
    #LearnerQuizAnswer = db.relationship('LearnerQuizAnswer', primaryjoin='learnerquizanswer.LearnerID == learner.LearnerID', backref='learner')
    #LearnerQuizAnswer = db.relationship('LearnerQuizAnswer', primaryjoin='learnerquizanswer.SectionMaterialsID == sectionoverview.SectionMaterialsID', backref='sectionoverview')

    QuizQn = db.relationship('QuizQn', primaryjoin='LearnerQuizAnswer.QuizQnID == QuizQn.QuizQnID', backref='LearnerQuizAnswer')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='LearnerQuizAnswer.CourseID == CourseOverview.CourseID', backref='LearnerQuizAnswer')
    SectionMaterials = db.relationship('SectionMaterials', primaryjoin='LearnerQuizAnswer.SectionMaterialsID == SectionMaterials.SectionMaterialsID', backref='LearnerQuizAnswer')
    SectionQuiz = db.relationship('SectionQuiz', primaryjoin='LearnerQuizAnswer.SectionQuizID == SectionQuiz.SectionQuizID', backref='LearnerQuizAnswer')
    SectionOverview = db.relationship('SectionOverview', primaryjoin='LearnerQuizAnswer.SectionID == SectionOverview.SectionID', backref='LearnerQuizAnswer')
    Learner = db.relationship('Learner', primaryjoin='LearnerQuizAnswer.LearnerID == Learner.LearnerID', backref='LearnerQuizAnswer')


    def json(self):
        return {'QuizQnID': self.QuizQnID, 'SectionQuizID':self.SectionQuizID, 'SectionMaterialsID':self.SectionMaterialsID, 'CourseID':self.CourseID
                , 'SectionID':self.SectionID, 'LearnerID':self.LearnerID, 'quizAnswer':self.quizAnswer}


    
class SolutionTable(db.Model):
    __tableName__ = 'SolutionTable'
    __mapper_args__ = {'polymorphic_identity': 'LearnerQuizAnswer'}
    QuizQnID = db.Column(db.ForeignKey(QuizQn.QuizQnID),nullable=False, primary_key=True)
    SectionQuizID = db.Column(db.ForeignKey(SectionQuiz.SectionQuizID), nullable=False, primary_key=True)
    SectionMaterialsID = db.Column(db.ForeignKey(SectionMaterials.SectionMaterialsID), nullable=False, primary_key=True)
    CourseID = db.Column(db.ForeignKey(CourseOverview.CourseID), nullable=False, primary_key=True)
    SectionID = db.Column(db.ForeignKey(SectionOverview.SectionID), nullable=False, primary_key=True)
    quizSolution = db.Column(db.String(10000), nullable=False)

    #SolutionTable = db.relationship('SolutionTable', primaryjoin='solutiontable.CourseID == courseoverview.CourseID', backref='courseoverview')
    #SolutionTable = db.relationship('SolutionTable', primaryjoin='solutiontable.QuizQnID == sectionoverview.QuizQnID', backref='sectionoverview')
    #SolutionTable = db.relationship('SolutionTable', primaryjoin='solutiontable.SectionQuizID == sectionoverview.SectionQuizID', backref='sectionoverview')
    #SolutionTable = db.relationship('SolutionTable', primaryjoin='solutiontable.SectionID == sectionoverview.SectionID', backref='sectionoverview')
    #SolutionTable = db.relationship('SolutionTable', primaryjoin='solutiontable.SectionMaterialsID == sectionoverview.SectionMaterialsID', backref='sectionoverview')

    QuizQn = db.relationship('QuizQn', primaryjoin='SolutionTable.QuizQnID == QuizQn.QuizQnID', backref='SolutionTable')
    CourseOverview = db.relationship('CourseOverview', primaryjoin='SolutionTable.CourseID == CourseOverview.CourseID', backref='SolutionTable')
    SectionMaterials = db.relationship('SectionMaterials', primaryjoin='SolutionTable.SectionMaterialsID == SectionMaterials.SectionMaterialsID', backref='SolutionTable')
    SectionQuiz = db.relationship('SectionQuiz', primaryjoin='SolutionTable.SectionQuizID == SectionQuiz.SectionQuizID', backref='SolutionTable')
    SectionOverview = db.relationship('SectionOverview', primaryjoin='SolutionTable.SectionID == SectionOverview.SectionID', backref='SolutionTable')

    def json(self):
        return {'QuizQnID': self.QuizQnID, 'SectionQuizID':self.SectionQuizID, 'SectionMaterialsID':self.SectionMaterialsID, 'CourseID':self.CourseID
                , 'SectionID':self.SectionID, 'quizSolution':self.quizSolution}


    

@app.route('/person/<int:PersonID>')
def trainer_by_email(PersonID):
    trainerDetails = Person.query.filter_by(PersonID=PersonID).first()
    if len(trainerDetails):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "Trainer": "works"
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "Trainer Details not found."
        }
    ), 404


@app.route('/enrollment', methods=['GET'])
def enrollment():
    enrollmentRecords = Enrollment.query.all()
    if len(enrollmentRecords):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "Enrollment": "works"
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "Enrollment details not found."
        }
    ), 404



if __name__ == '__main__':
    print("This is flask for " + os.path.basename(__file__) + ": retrieve Details ...")
    app.run(host='0.0.0.0', port=5016, debug=True)
