# JiaQi's TDD

import PersonClass
#PersonClass.path.append('/.../spm-project/')
from PersonClass import Enrollment
from PersonClass import *
from routes import *

from flask import Flask
import json


def test_new_enrolment():
    """
    GIVEN a Enrollment model
    WHEN a new Enrollment is created
    THEN check the LearnerID, CourseID,ClassID,Approved and passPrerequisite fields are defined correctly
    """
    enroll = Enrollment(9, 8, 5, 13, False, False)
    assert enroll.LearnerID == 9
    assert enroll.CourseID == 5
    assert enroll.ClassID == 13
    assert enroll.Approved == False
    assert enroll.passPrerequisite == False

def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200

def test_get_enrolment():
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
    url = 'http://3.144.166.168:5016/enrollment'
    response = client.get(url)
    assert response.status_code == 200

def test_get_enrolment_byID():
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
    url = 'http://3.144.166.168:5016/getEnrollment/1'

    response = client.get(url)
    assert response.status_code == 200

def test_get_selfEnroll():
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
    url = 'http://3.144.166.168:5016/insertSelfEnrol'

    mock_headers ={'Content-type': 'application/json', 'Accept': 'text/plain'}
    mock_request_data = {
        'LearnerID': 1,
        'CourseID': 1,
        'ClassID':1,
        'Approved': False,
        'passPrerequisite': False
    }

    response = client.post(url,data=json.dumps(mock_request_data), headers = mock_headers)
    assert response.status_code == 200