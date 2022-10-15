from flask import Blueprint, jsonify, abort, request
from ..models import Advisor, Student, Course, db


bp = Blueprint('courses',__name__, url_prefix='/courses')

@bp.route('', methods=['GET'])
def index():
    courses = Course.query.all() # ORM perfrms SELECT query
    result = []
    for c in courses:
        result.append(c.serialize()) # build list of Users as dictionary
    return jsonify(result) # return JSON response

@bp.route('/add',methods=['POST'])
def create():

    c = Course(
        course_name=request.json['course_name'],
        schedule=request.json['schedule'],
        course_code=request.json['course_code'],
       
    )
    db.session.add(c) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(c.serialize())