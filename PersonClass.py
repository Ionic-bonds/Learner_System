import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
from sqlalchemy.sql import expression
from datetime import datetime
import json
from os import environ

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('dbURL') or 'mysql+mysqlconnector://root@localhost:3306/person'
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
    LearnerID = db.Column(db.Foreignkey('trainer.LearnerID'), nullable=False, primary_key = True)
    LearnerRecordID = db.Column(db.Integer,nullable=False, primary_key=True)
    enrolledCourse = db.Column(db.String(100), nullable=False)
    enrolledClass = db.Column(db.String(100), nullable=False)
    FinalQuizResult = db.Column(db.String(100), nullable=False)
    courseStatus = db.Column(db.Boolean, nullable=False)
    SectionProgress = db.Column(db.Float(precision=2),nullable=False)

    LearnerRecord = db.relationship('learner', primaryjoin='learnerrecord.LearnerID == learner.LearnerID', backref='LearnerRecord')

class CourseOverview(db.Model):
    __tableName__ = 'CourseOverview'
    __mapper_args__ = {'polymorphic_identity': 'CourseOverview'}
    CourseID = db.Column(db.Integer, primary_key=True)
    CourseName = db.Column(db.String(100), nullable=False)
    CourseDescription = db.Column(db.String(100), nullable=False)
    CourseStatus = db.Column(db.Boolean, nullable=False)


class TrainerSchedule(db.Model):
    __tableName__ = 'TrainerSchedule'
    __mapper_args__ = {'polymorphic_identity': 'TrainerSchedule'}
    TrainerID = db.Column(db.Foreignkey('trainer.TrainerID'), nullable=False)
    CourseID = db.Column(db.Foreignkey('courseoverview.CourseID'), nullable=False)
    TrainerScheduleID = db.Column(db.Integer,nullable=False, primary_key=True)

    TrainerSchedule = db.relationship('trainer', primaryjoin='trainerschedule.TrainerID == trainer.TrainerID', backref='TrainerSchedule')
    TrainerSchedule = db.relationship('courseoverview', primaryjoin='trainerschedule.CourseID == courseoverview.CourseID', backref='TrainerSchedule')


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
