import os
from os import path
import PersonClass
#PersonClass.path.append('/.../spm-project/')
from PersonClass import SectionOverview
from PersonClass import *
from routes import *

from flask import Flask
import json

def test_new_section_overview():
    Section_Quiz = SectionOverview(2, 2, 'In this section, you will be learning how to keep your documents safe by utilizing the secure print features. You will learn to use various security features and tools.', 100)
    assert Section_Quiz.SectionID == 2
    assert Section_Quiz.CourseID == 2
    assert Section_Quiz.SectionDescription == 'In this section, you will be learning how to keep your documents safe by utilizing the secure print features. You will learn to use various security features and tools.'
    assert Section_Quiz.SectionProgress == 100



def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200

def test_get_section_overview():
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




        