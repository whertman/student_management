# Student Management Database API

This application is intended as a student and course management tool for an institution's academic advisors.

# Endpoints
| HTTP Method | URI |
| --- | --- |
| GET | /students |
| POST | /students |
| GET | /advisors |
| POST | /advisors |
| DELETE | /advisors

Additional endpoints for course, instructor, and textbook management functions are to be added soon. Please note that there is no DELETE option for student data by design, as historical records of enrolled students need to be preserved within the database.
# Project Design
The project was designed as part of Nucamp's BackEnd w/DevOps bootcamp. The design evolved over its lifespan as the scope of the project became more defined, especially considering the limited project timeline, to be a leaner, more stream-lined application which can be built out for increased functionality after initial deployment.

## ER Diagram
The application was conceptualized first through an entity-relationship diagram, in which each entity and its associated attributes were defined, and relationships between each entity were mapped. Special care was taken to include one-to-many, many-to-many, and one-to-one relationships, as well as to enforce foreign key contstraints between them in the database design.

## Database Implementation
A PostgreSQL database was implemented using the SQLAlchemy ORD migration capabilities with Psycopg2. Sample data was then manually added via SQL queries using pgadmin, the built-in GUI that comes with PostgreSQL.

## ORM vs. Raw SQL approach

I opted for the ORM approach for the project because I wanted to gain additional experience with object-oriented programming principles. Because of my solid understanding of SQL, it made sense to get more practice in areas where my skills are weaker. The ORM approach presents more of challenge for me at this point in my development

# Further Development
In addition to adding more endopoints, the goal is to create front-end, graphical user interface (GUI) an deploy the application to a cloud-based server, such as AWS, Google Cloud, or Heroku. This allows the end user to avoid incurring the cost of server and application maintenance, and allows scalability, as needed.

# Technologies Used

* PostgreSQL
* Docker
* SQLAchemy
* Python 3
* Flask
* Psycopg2
* Insomnia (testing)

The application was built using Python 3, with Flask/SQLAlchemy frameworks. The PostgreSQL database runs inside a Docker container, and Insomnia was used to test API functionality.

# Data Visualization
See the project_viz.py file for an sample visualization using Python's Pandas, NumPy, Matplotlib, and Psycopg2 libraries.






# course_management
# course_management
