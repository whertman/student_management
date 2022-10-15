from flask import Blueprint, jsonify, abort, request
from ..models import Advisor, Student, db


bp = Blueprint('advisors',__name__, url_prefix='/advisors')

@bp.route('', methods=['GET'])
def index():
    advisors = Advisor.query.all() # ORM perfrms SELECT query
    result = []
    for a in advisors:
        result.append(a.serialize()) # build list of Users as dictionary
    return jsonify(result) # return JSON response


@bp.route('',methods=['POST'])
def create():
    if 'username' not in request.json or 'email' not in request.json:
        return abort(400)
    if len(request.json['username']) < 3:
        return abort(400)

    a = Advisor(
        first_name=request.json['first_name'],
        last_name=request.json['last_name'],
        department=request.json['department'],
        username=request.json['username'],
        email=(request.json['email'])
    )
    db.session.add(a) # prepare CREATE statement
    db.session.commit() # execute CREATE statement
    return jsonify(a.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    a = Advisor.query.get_or_404(id)
    try:
        db.session.delete(a) #prepare DELETE statement
        db.session.commit() # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)