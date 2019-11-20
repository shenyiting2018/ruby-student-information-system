ruby-student-information-system
================================
Author: [Yiting Shen](https://www.linkedin.com/in/shenyiting/) 


This is a ruby-based student information system 


# Table Design
*Student*
- id: int
- first_name: varchar
- last_name: varchar
- email: varchar
- class: int
- type: int

# RESTful API
*students*
- GET: /students   - List all students
- POST: /student   - Create a new student
- GET: /student/<id>    - Get the student detail
- PUT: /student   - Edit student 
- DELETE: /student/<id>   - Delete student 

