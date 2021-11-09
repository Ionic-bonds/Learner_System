#Timothy's TDD

import PersonClass
import os
from os import path
#PersonClass.path.append('/.../spm-project/')
from PersonClass import TrainerSchedule
from PersonClass import *
from routes import *

from flask import Flask
import json


def test_createTrainerSchedule():
    """
    GIVEN a TrainerSchedule model
    WHEN a new Enrollment is created
    THEN check the LearnerID, CourseID,ClassID,Approved and passPrerequisite fields are defined correctly
    """
    trainerSchedule = TrainerSchedule(1,1,1)
    assert trainerSchedule.TrainerID == 1
    assert trainerSchedule.CourseID == 1
    assert trainerSchedule.TrainerScheduleID == 1

def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200
def test_trainerschedule():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('dbURL') or 'mysql+mysqlconnector://spm:spmteam09@spm-database-1.cujkm1zfxmqs.us-east-2.rds.amazonaws.com:3306/LearnerSystem'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {'pool_recycle': 299}
    app.config['DEBUG'] = True
    app.config['TESTING'] = True

    db = SQLAlchemy(app)
    CORS(app)
    configure_routes(app)
    client = app.test_client()
    url = 'http://3.144.166.168:5016/trainerschedule/1'
    response = client.get(url)
    assert response.status_code == 200

def test_trainerschedule_bycourseid():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = environ.get('dbURL') or 'mysql+mysqlconnector://spm:spmteam09@spm-database-1.cujkm1zfxmqs.us-east-2.rds.amazonaws.com:3306/LearnerSystem'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {'pool_recycle': 299}
    app.config['DEBUG'] = True
    app.config['TESTING'] = True

    db = SQLAlchemy(app)
    CORS(app)
    configure_routes(app)
    client = app.test_client()
    url = 'http://3.144.166.168:5016/trainerschedule/1'

    mock_request_data = {
      "CourseID": 1, 
      "TrainerID":1,
      "TrainerScheduleID":1

    }

    response = client.get(url, data= mock_request_data)
    assert response.status_code == 200
