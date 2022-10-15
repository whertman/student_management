from flask import Blueprint, jsonify, abort, request
from ..models import Student, db, Advisor


bp = Blueprint('students',__name__, url_prefix='/students')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    students = Student.query.all() # ORM perfrms SELECT query
    result = []
    for s in students:
        result.append(s.serialize()) # build list of Users as dictionary
    return jsonify(result) # return JSON response

@bp.route('/<int:id>', methods=['GET'])

def show(id: int):
    s = Student.query.get_or_404(id)
    return jsonify(s.serialize())

@bp.route('/add',methods=['POST'])
def create():
    if 'email' not in request.json:
        return abort(400)

    s = Student(
        first_name=request.json['first_name'],
        last_name=request.json['last_name'],
        major=request.json['major'],
        class_yr=request.json['class_yr'],
        advisor_id=request.json['advisor_id'],
        email=(request.json['email'])
    )
    db.session.add(s) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(s.serialize())

