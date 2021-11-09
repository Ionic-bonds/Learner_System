import os
from os import path
import PersonClass
#PersonClass.path.append('/.../spm-project/')
from PersonClass import QuizQn
from PersonClass import *
from routes import *

from flask import Flask
import json

def test_new_quiz_qn():
    quiz_qn = QuizQn(2,5,2,1,8,'A display listing of program options which users can select, is called',4,'Monitor')
    assert quiz_qn.QuizQnID == 2
    assert quiz_qn.CourseID == 5
    assert quiz_qn.SectionMaterialsID == 2
    assert quiz_qn.SectionQuizID == 1  
    assert quiz_qn.SectionID == 8
    assert quiz_qn.QuizQuestion == 'A display listing of program options which users can select, is called'  
    assert quiz_qn.QuizOptionNo == 4
    assert quiz_qn.QuizOption == 'Monitor'    

def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200

def test_get_quiz_qn():
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
    url = 'http://3.144.166.168:5016/quizquestions'
    response = client.get(url)
    assert response.status_code == 200

def test_quiz_qn_details():
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
    url = 'http://3.144.166.168:5016/quizquestions/1'

    mock_request_data = {
      "CourseID": 1, 
      "QuizQnID": 1, 
      "SectionID": 1, 
      "SectionMaterialsID": 1, 
      "SectionQuizID": 1

    }

    response = client.get(url, data= mock_request_data)
    assert response.status_code == 200
        