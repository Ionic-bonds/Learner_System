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
    __tableName__ = 'Person'
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
    PersonID = db.Column(db.ForeignKey('Person.PersonID'), nullable=False, primary_key=False)
    TrainerID = db.Column(db.Integer, primary_key=True)

    Trainer = db.relationship('Person', primaryjoin='Trainer.PersonID == Person.PersonID', backref='Trainer')
    
    def json(self):
        return {'TrainerID': self.TrainerID,'PersonID': self.PersonID}

class Learner(Person):
    __tableName__ = 'Learner'
    __mapper_args__ = {'polymorphic_identity': 'Learner'}
    PersonID = db.Column(db.ForeignKey('Person.PersonID'), nullable=False, primary_key=False)
    LearnerID = db.Column(db.Integer, primary_key=True)

    Learner = db.relationship('Person', primaryjoin='Learner.PersonID == Person.PersonID', backref='Learner')
    
    def json(self):
        return {'LearnerID': self.LearnerID, 'PersonID':self.PersonID}

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
