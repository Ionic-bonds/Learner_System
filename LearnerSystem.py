from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://root:root' + \
                                        '@localhost:3306/is212_example'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {'pool_size': 100,
                                           'pool_recycle': 280}

db = SQLAlchemy(app)

CORS(app)

class Person(db.Model):
    __tablename__ = 'person'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50))
    title = db.Column(db.String(10))

    __mapper_args__ = {
        'polymorphic_identity': 'person'
    }

    def to_dict(self):
        """
        'to_dict' converts the object into a dictionary,
        in which the keys correspond to database columns
        """
        columns = self.__mapper__.column_attrs.keys()
        result = {}
        for column in columns:
            result[column] = getattr(self, column)
        return result


@app.route("/persons/<int:person_id>")
def person_by_id(person_id):
    person = Person.query.filter_by(id=person_id).first()
    if person:
        return jsonify({
            "data": person.to_dict()
        }), 200
    else:
        return jsonify({
            "message": "Person not found."
        }), 404


@app.route("/trainer")
def trainer():
    search_name = request.args.get('name')
    if search_name:
        trainer_list = trainer.query.filter (trainer.name.contains(search_name))
    else:
        trainer_list = trainer.query.all()
    return jsonify(
        {
            "data": [trainer.to_dict() for trainer in trainer_list]
        }
    ), 200


@app.route("/trainer", methods=['POST'])
def create_trainer():
    data = request.get_json()
    if not all(key in data.keys() for
               key in ('name', 'title')):
        return jsonify({
            "message": "Incorrect JSON object provided."
        }), 500
    trainer = trainer(**data)
    try:
        db.session.add(trainer)
        db.session.commit()
        return jsonify(trainer.to_dict()), 201
    except Exception:
        return jsonify({
            "message": "Unable to commit to database."
        }), 500


@app.route("/learner")
def learner():
    search_name = request.args.get('name')
    if search_name:
        learner_list = learner.query.filter(learner.name.contains(search_name))
    else:
        learner_list = learner.query.all()
    return jsonify(
        {
            "data": [learner.to_dict() for learner in learner_list]
        }
    ), 200


@app.route("/learner", methods=['POST'])
def create_learner():
    data = request.get_json()
    if not all(key in data.keys() for
               key in ('name', 'title')):
        return jsonify({
            "message": "Incorrect JSON object provided."
        }), 500
    learner = learner(**data)
    try:
        db.session.add(learner)
        db.session.commit()
        return jsonify(learner.to_dict()), 201
    except Exception:
        return jsonify({
            "message": "Unable to commit to database."
        }), 500



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
