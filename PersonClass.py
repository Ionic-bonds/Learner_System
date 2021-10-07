import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from sqlalchemy.sql import expression
from datetime import datetime
import json
from os import environ

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('dbURL') or 'mysql+mysqlconnector://root@localhost:3306/payment'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {'pool_recycle': 299}

db = SQLAlchemy(app)
CORS(app)

class Person(db.Model):
    __tableName__ = 'person'
    __mapper_args__ = {'polymorphic_identity': 'Person'}
    PersonID = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    NRIC = db.Column(db.String(100), nullable=False)
    ContactNo = db.Column(db.Integer, nullable=False)
    email = db.Column(db.String(100),nullable=False)

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
    __mapper_args__ = {'polymorphic_identity': 'Trainer'}
    PersonID = db.Column(db.ForeignKey('person.PersonID'), nullable=False)
    TrainerID = db.Column(db.Integer, primary_key=True)

    Trainer = db.relationship('person', primaryjoin='Trainer.PersonID == Person.PersonID', backref='Trainer')
    
    def json(self):
        return {'TrainerID': self.TrainerID,'PersonID': self.PersonID}

class Learner(Person):
    __tableName__ = 'Learner'
    __mapper_args__ = {'polymorphic_identity': 'Learner'}
    PersonID = db.Column(db.ForeignKey('person.PersonID'), nullable=False, primary_key=False)
    LearnerID = db.Column(db.Integer, primary_key=True)

    Learner = db.relationship('person', primaryjoin='Learner.PersonID == Person.PersonID', backref='Learner')
    
    def json(self):
        return {'LearnerID': self.LearnerID, 'PersonID':self.PersonID}

class LearnerRecord(db.Model):
    __tableName__ = 'LearnerRecord'
    __mapper_args__ = {'polymorphic_identity': 'LearnerRecord'}
    LearnerID = db.Column(db.ForeignKey('learner.LearnerID'), nullable=False, primary_key=True)
    LearnerRecordID = db.Column(db.Integer,nullable=False, primary_key=True)
    enrolledCourse = db.Column(db.String(100), nullable=False)
    enrolledClass = db.Column(db.String(100), nullable=False)
    FinalQuizResult = db.Column(db.String(100), nullable=False)
    courseStatus = db.Column(db.Boolean, nullable=False)
    SectionProgress = db.Column(db.Float(precision=2),nullable=False)

    LearnerRecord = db.relationship('learner', primaryjoin='learnerrecord.LearnerID == learner.LearnerID', backref='LearnerRecord')

    def json(self):
        return {'LearnerID': self.LearnerID, 'LearnerRecordID': self.LearnerRecordID, 'enrolledCourse': self.enrolledCourse, 'enrolledClass': self.enrolledClass,
        'FinalQuizResult' :self.FinalQuizResult, 'courseStatus': self.courseStatus, 'SectionProgress': self.SectionProgress}



class CourseOverview(db.Model):
    __tableName__ = 'CourseOverview'
    __mapper_args__ = {'polymorphic_identity': 'CourseOverview'}
    CourseID = db.Column(db.Integer, primary_key=True)
    CourseName = db.Column(db.String(100), nullable=False)
    CourseDescription = db.Column(db.String(100), nullable=False)
    CourseStatus = db.Column(db.Boolean, nullable=False)

    def json(self):
        return {'CourseID': self.CourseID, 'CourseName':self.CourseName , 'CourseDescription':self.CourseDescription ,'CourseStatus':self.CourseStatus }

class SectionOverview(db.Model):
    __tableName__ = 'SectionOverview'
    __mapper_args__ = {'polymorphic_identity': 'SectionOverview'}
    SectionID = db.Column(db.Integer, primary_key=True)
    CourseID = db.Column(db.ForeignKey('courseoverview.CourseID'), nullable=False, primary_key=True)
    SectionDescription = db.Column(db.String(100), nullable=False)
    SectionProgress = db.Column(db.Float(precision=2),nullable=False)

    SectionOverview = db.relationship('courseoverview', primaryjoin='sectionoverview.CourseID == courseoverview.CourseID', backref='SectionOverview')

    def json(self):
        return {'SectionID': self.SectionID, 'CourseID':self.CourseID , 'SectionDescription':self.SectionDescription ,'SectionProgress':self.SectionProgress }

class SectionMaterials(db.Model):
    __tableName__ = 'SectionMaterials'
    __mapper_args__ = {'polymorphic_identity': 'SectionMaterials'}
    SectionMaterialsID = db.Column(db.Integer, primary_key=True)
    SectionID = db.Column(db.ForeignKey('sectionoverview.SectionID'), nullable=False, primary_key=True)
    SectionMaterials = db.Column(db.String(100), nullable=False)
    CourseID = db.Column(db.ForeignKey('courseoverview.CourseID'), nullable=False, primary_key=True)
    # SectionDescription = db.Column(db.String(100), nullable=False)
    # SectionProgress = db.Column(db.Float(precision=2),nullable=False)

    SectionMaterials = db.relationship('sectionoverview', primaryjoin='sectionmaterial.SectionID == sectionoverview.SectionID', backref='SectionMaterials')
    SectionMaterials = db.relationship('courseoverview', primaryjoin='sectionmaterial.CourseID == courseoverview.CourseID', backref='SectionMaterials')

    def json(self):
        return {'SectionMaterialsID': self.SectionMaterialsID, 'SectionID':self.SectionID , 'SectionMaterials':self.SectionMaterials ,'CourseID':self.CourseID }


class SectionQuiz(db.Model):
    __tableName__ = 'SectionQuiz'
    __mapper_args__ = {'polymorphic_identity': 'SectionQuiz'}
    SectionQuizID = db.Column(db.Integer, primary_key=True)
    SectionID = db.Column(db.ForeignKey('sectionoverview.SectionID'), nullable=False, primary_key=True)
    CourseID = db.Column(db.ForeignKey('courseoverview.CourseID'), nullable=False, primary_key=True)
    SectionMaterialsID = db.Column(db.Integer, primary_key=True)
    quizType = db.Column(db.String(1), nullable=False)
    quizResult = db.Column(db.Integer, primary_key=True)
    duration = db.Column(db.Integer, primary_key=True)
    quizStartTime = db.Column(db.DateTime, nullable=False)

    SectionMaterials = db.relationship('sectionmaterials', primaryjoin='sectionquiz.SectionMaterialsID == sectionmaterials.SectionMaterialsID', backref='SectionQuiz')
    SectionMaterials = db.relationship('sectionoverview', primaryjoin='sectionquiz.SectionID == sectionoverview.SectionID', backref='SectionQuiz')
    SectionMaterials = db.relationship('courseoverview', primaryjoin='sectionquiz.CourseID == courseoverview.CourseID', backref='SectionQuiz')

    def json(self):
        return {'SectionQuizID': self.SectionQuizID, 'SectionID':self.SectionID , 'CourseID':self.CourseID ,'SectionMaterialsID':self.SectionMaterialsID ,'quizType':self.quizType ,'quizResult':self.quizResult ,'duration':self.duration ,'quizStartTime':self.quizStartTime }


class TrainerSchedule(db.Model):
    __tableName__ = 'TrainerSchedule'
    __mapper_args__ = {'polymorphic_identity': 'TrainerSchedule'}
    TrainerID = db.Column(db.ForeignKey('trainer.TrainerID'), nullable=False, primary_key=False)
    CourseID = db.Column(db.ForeignKey('courseoverview.CourseID'), nullable=False)
    TrainerScheduleID = db.Column(db.Integer,nullable=False, primary_key=True)

    TrainerSchedule = db.relationship('trainer', primaryjoin='trainerschedule.TrainerID == trainer.TrainerID', backref='TrainerSchedule')
    TrainerSchedule = db.relationship('courseoverview', primaryjoin='trainerschedule.CourseID == courseoverview.CourseID', backref='TrainerSchedule')

    def json(self):
        return {'TrainerID': self.TrainerID, 'CourseID':self.CourseID , 'TrainerScheduleID':self.TrainerScheduleID}


class ClassDescription(db.Model):
    __tableName__ = 'ClassDescription'
    __mapper_args__ = {'polymorphic_identity': 'ClassDescription'}
    CourseID = db.Column(db.ForeignKey('courseoverview.CourseID'), nullable=False, primary_Key=True)
    ClassID = db.Column(db.Integer,nullable=False, primary_key=True)
    ClassSize = db.Column(db.Integer, nullable=False)
    StartTime = db.Column(db.DateTime, nullable=False)
    StartDate = db.Column(db.DateTime, nullable=False)
    EndTime = db.Column(db.DateTime, nullable=False)
    EndDate = db.Column(db.DateTime, nullable=False)

    ClassDescription = db.relationship('courseoverview', primaryjoin='classdescription.CourseID == courseoverview.CourseID', backref='ClassDescription')
   
    def json(self):
        return {'CourseID': self.CourseID, 'ClassID':self.ClassID , 'ClassSize':self.ClassSize, 
                'StartTime':self.StartTime,'StartDate':self.StartDate,'EndTime':self.EndTime,'EndDate':self.EndDate}

class CourseRecord(db.Model):
    __tableName__ = 'CourseRecord'
    __mapper_args__ = {'polymorphic_identity': 'CourseRecord'}
    CourseID = db.Column(db.ForeignKey('courseoverview.CourseID'), nullable=False)
    TrainerScheduleID = db.Column(db.ForeignKey('trainerschedule.TrainerScheduleID'), nullable=False, primary_Key=True)
    LearnerID = db.Column(db.ForeignKey('learner.LearnerID'), nullable=False, primary_Key=True)
    ClassID = db.Column(db.ForeignKey('classdescription.ClassID'), nullable=False, primary_Key=True)

    #Here got issue => Need to use CourseRecord then join into TrainerSchedule table to Trainer & Trainschedule to courseoverview in 1 line
    CourseRecord = db.relationship('trainer', primaryjoin='trainerschedule.TrainerID == trainer.TrainerID', backref='TrainerSchedule')
    CourseRecord = db.relationship('courseoverview', primaryjoin='trainerschedule.CourseID == courseoverview.CourseID', backref='TrainerSchedule')

    def json(self):
        return {'CourseID': self.CourseID, 'TrainerScheduleID':self.TrainerScheduleID , 'LearnerID':self.LearnerID, 'ClassID':self.ClassID}


#Here probably have the same issue as the codes above
class QuizQn(db.Model):
    __tableName__ = 'QuizQn'
    __mapper_args__ = {'polymorphic_identity': 'QuizQn'}
    QuizQnID = db.Column(db.Integer,nullable=False, primary_key=True)
    CourseID = db.Column(db.ForeignKey('courseoverview.CourseID'), nullable=False)
    SectionMaterialsID = db.Column(db.ForeignKey('sectionoverview.SectionMaterialsID'), nullable=False)
    SectionQuizID = db.Column(db.ForeignKey('sectionoverview.SectionQuizID'), nullable=False)
    SectionID = db.Column(db.ForeignKey('sectionoverview.SectionID'), nullable=False)
    QuizQuestion = db.Column(db.varchar(1000), nullable=False)
    QuizOptionNo = db.Column(db.integer, nullable=False)
    QuizOption = db.Column(db.varchar(100), nullable=False)

    QuizQn = db.relationship('courseoverview', primaryjoin='QuizQn.CourseID == courseoverview.CourseID', backref='QuizQn')
    QuizQn = db.relationship('sectionoverview', primaryjoin='QuizQn.SectionMaterialsID == sectionoverview.SectionMaterialsID', backref='QuizQn')
    QuizQn = db.relationship('sectionoverview', primaryjoin='QuizQn.SectionQuizID == sectionoverview.SectionQuizID', backref='QuizQn')
    QuizQn = db.relationship('sectionoverview', primaryjoin='QuizQn.SectionID == sectionoverview.SectionID', backref='QuizQn')

@app.route('/trainer/<string:email>')
def trainer_by_email(email):
    trainerDetails = Person.query.filter_by(email=email).first()
    if len(trainerDetails):
        return jsonify(
            {
                "code": 200,
                "data": {
                    "Trainer": [element.json() for element in trainerDetails]
                }
            }
        )
    return jsonify(
        {
            "code": 404,
            "message": "Trainer Details not found."
        }
    ), 404


if __name__ == '__main__':
    print("This is flask for " + os.path.basename(__file__) + ": retrieve Trainer Details ...")
    app.run(host='0.0.0.0', port=5016, debug=True)
