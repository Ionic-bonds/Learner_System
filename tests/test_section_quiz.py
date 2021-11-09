import os
from os import path
import PersonClass
#PersonClass.path.append('/.../spm-project/')
from PersonClass import SectionQuiz
from PersonClass import *
from routes import *

from flask import Flask
import json

def test_new_SectionQuiz():
    Section_Quiz = SectionQuiz(1,1,1,1,'P',90,'12:30:00')
    assert Section_Quiz.SectionQuizID == 1
    assert Section_Quiz.SectionID == 1
    assert Section_Quiz.SectionMaterialsID == 1
    assert Section_Quiz.CourseID == 1
    assert Section_Quiz.quizResult == 'P'
    assert Section_Quiz.duration == 90
    assert Section_Quiz.quizStartTime == '12:30:00'


def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200

def test_get_section_quiz():
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


        