#  Elvis' TDD
from routes import *

def test_new_course_record():
    courseRecord = CourseRecord(1, 20, 1, 1, 1, 10, "NA")
    assert courseRecord.CourseID == 1
    assert courseRecord.CourseRecordID == 20
    assert courseRecord.TrainerScheduleID == 1
    assert courseRecord.LearnerID == 1
    assert courseRecord.ClassID == 1
    assert courseRecord.CourseProgress == 10
    assert courseRecord.FinalQuizResult == "NA"

def test_base_route():
    app = Flask(__name__)
    configure_routes(app)
    client = app.test_client()
    url = '/'

    response = client.get(url)
    assert response.get_data() == b'Hello, World!'
    assert response.status_code == 200

def test_get_course_record():
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
    url = 'http://3.144.166.168:5016/courserecord'
    response = client.get(url)
    assert response.status_code == 200

def test_get_course_record_by_courseID():
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
    url = 'http://3.144.166.168:5016/courserecord/1'
    response = client.get(url)
    assert response.status_code == 200