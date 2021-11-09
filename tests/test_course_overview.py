import os
from os import path
import PersonClass
#PersonClass.path.append('/.../spm-project/')
from PersonClass import CourseOverview
from PersonClass import *
from routes import *

from flask import Flask
import json

def test_new_section_overview():
    Course_Overview = CourseOverview(5,'Practical Practices W76', 'Practice makes perfect. Practice practicing.', True)
    assert Course_Overview.CourseID == 5
    assert Course_Overview.CourseName == 'Practical Practices W76'
    assert Course_Overview.CourseDescription == 'Practice makes perfect. Practice practicing.'
    assert Course_Overview.Prerequisite == True

def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200

def test_get_course_overview():
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
    url = 'http://3.144.166.168:5016/courseoverview'
    response = client.get(url)
    assert response.status_code == 200

def test_course_overview_details():
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
    url = 'http://3.144.166.168:5016/courseoverview/1'

    mock_request_data = {
        "CourseDescription": "Xerox now offers on-demand training for added convenience and flexibility at no additional cost to you. No matter where you are, 24/7 access to training will be available through Xerox. Learn how to properly use your office technology to get day-to-day work done more efficiently. Here are some examples of how training can help you:Keep documents safe by utilizing the secure print feature, Maximize machine uptime by properly clearing paper jams, Go digital with scan to email and more.", 
        "CourseID": 1, 
        "CourseName": "Fundamentals of Xerox WorkCentre 7845", 
        "Prerequisite": False

    }

    response = client.get(url, data= mock_request_data)
    assert response.status_code == 200
        