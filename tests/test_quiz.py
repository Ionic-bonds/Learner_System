# Wong Wei Kit (Leonard)'s TDD

import os
from os import path
import PersonClass
#PersonClass.path.append('/.../spm-project/')
from PersonClass import SectionQuiz
from PersonClass import *
from routes import *

from flask import Flask
import json


def test_quiz():
    """
    GIVEN a Quiz model
    WHEN a new Quiz is created
    THEN check the SectionQuizID, SectionID,SectionMaterialsID,CourseID,quizResult,duration,quizStartTime
    """
    Quiz = SectionQuiz(1, 1, 1, 2,'P',90, '12:00:00')
    assert Quiz.SectionQuizID == 1
    assert Quiz.SectionID == 1
    assert Quiz.SectionMaterialsID == 1
    assert Quiz.CourseID == 2
    assert Quiz.quizResult == 'P'
    assert Quiz.duration == 90
    assert Quiz.quizStartTime == '12:00:00'


def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200

def test_get_quiz():
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
    url = 'http://3.144.166.168:5016/sectionquiz'
    response = client.get(url)
    assert response.status_code == 200

def test_get_quiz_byID():
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
    url = 'http://3.144.166.168:5016/sectionquiz/1'

    mock_request_data = {
        'SectionQuizID': 1,
        'SectionID': 1,
        'SectionMaterialsID': 1,
        'CourseID': 1,
        'quizResult':'P',
        'duration': 90,
        'quizStartTime': '12:30:00'

    }

    response = client.get(url, data= mock_request_data)
    assert response.status_code == 200