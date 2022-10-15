from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()

class Student(db.Model):
    __tablename__ = 'students'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)
    major = db.Column(db.String(128), nullable=False)
    class_yr = db.Column(db.String(128), nullable=False)
    # credits_earned = db.Column(db.Integer)
    # gpa = db.Column(db.Float, nullable=False)
    advisor_id = db.Column(db.Integer, db.ForeignKey('advisors.id'), nullable=False)
    # residence_hall_id = db.Column(db.Integer, db.ForeignKey('residence_halls.id'))

    def __init__(self, last_name: str, first_name: str, class_yr: str, advisor_id: int, major: str, email: str):
        self.last_name = last_name
        self.first_name = first_name
        self.class_yr = class_yr
        self.advisor_id = advisor_id
        self.major = major
        self.email = email

    def serialize(self):
        return {
            'id': self.id,
            'last_name': self.last_name,
            'first_name': self.first_name,
            'class_yr': self.class_yr,
            'major': self.major
        }
    
class Advisor(db.Model):
    __tablename__ = 'advisors'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)
    department = db.Column(db.String(128), nullable=False)
    username = db.Column(db.String(128), unique=True, nullable=False)
    email = db.Column(db.String(128), nullable=False)

    def __init__(self, first_name:str, last_name:str, department:str, username:str, email:str):
        self.first_name = first_name
        self.last_name = last_name
        self.department = department
        self.username = username
        self.email = email

    def serialize(self):
        return {
            'last_name': self.last_name,
            'first_name': self.first_name,
            'email': self.email,
            'username': self.username
        }
    students = db.relationship('Student', backref='advisor', cascade="all,delete")

class Course(db.Model):
    __tablename__ = 'courses'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    course_name = db.Column(db.String(128), nullable=False)
    schedule = db.Column(db.String(128))
    max_capacity = db.Column(db.Integer)
    term = db.Column(db.String(128), nullable=False)
    instructor_id = db.Column(db.Integer, db.ForeignKey('instructors.id'), nullable=False)
    textbook_id = db.Column(db.Integer, db.ForeignKey('textbooks.id'), nullable=False)
    course_code = db.Column(db.String(128), nullable=False)

class Instructor(db.Model):
    __tablename__ = 'instructors'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    last_name = db.Column(db.String(128), nullable=False)
    department = db.Column(db.String(128), nullable=False)
    office_loc = db.Column(db.String(128))

class Residence(db.Model):
    __tablename__ = 'residence_halls'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), nullable=False)
    max_students = db.Column(db.Integer)

class Textbook(db.Model):
    __tablename__ = 'textbooks'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    author = db.Column(db.String(128), nullable=False)
    publisher = db.Column(db.String(128))
    title = db.Column(db.String(128), nullable=False)
    price = db.Column(db.Float, nullable=False)

students_textbooks = db.Table(
'students_textbooks',
db.Column(
    'student_id', db.Integer,
    db.ForeignKey('students.id'),
    primary_key=True
),

db.Column(
    'textbook_id', db.Integer,
    db.ForeignKey('textbooks.id'),
    primary_key=True
)
)
students_residence_halls = db.Table(
    'students_residence_halls',
db.Column(
    'student_id', db.Integer,
    db.ForeignKey('students.id'),
    primary_key=True
),

db.Column(
    'residence_hall_id', db.Integer,
    db.ForeignKey('residence_halls.id'),
    primary_key=True
)
)

students_courses = db.Table(
    'students_courses',
    db.Column(
        'student_id', db.Integer,
        db.ForeignKey('students.id'),
        primary_key=True
    ),

    db.Column(
        'course_id', db.Integer,
        db.ForeignKey('courses.id'),
        primary_key=True
    )
)