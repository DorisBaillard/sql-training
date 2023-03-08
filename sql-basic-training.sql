#Here I create a table from scratch, composed of 3 columns that are "student_id" (my primary key), 'name' and 'major' (student's class)
#Note to self : I can use the function AUTO_INCREMENT to initialise an automatic incrementation of student_id
#student_id INT AUTO_INCREMENT

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    major VARCHAR(20)
);


-- I use a describe query to check if the table exists
DESCRIBE student;

#Here I inserted a few rows, then used a SELECT request to visualize my table
INSERT INTO student VALUES(1, 'Jack','Biology');
INSERT INTO student VALUES(2, 'Kate','sociology');
#note: let's imagine that some values are missing. For example I don't have the student's major
#I can use the request : INSERT INTO student(student_id, name) VALUES(3, 'Claire');
INSERT INTO student VALUES(3, 'Claire', 'Chemistry');
INSERT INTO student VALUES(4, 'Jack','Biology');
INSERT INTO student VALUES(5, 'Mike','Computer Science');

SELECT * FROM student;

#note to self : if I want to drop a specific table : 
#DROP TABLE student

#for updating

UPDATE student 
SET major = "Bio"
WHERE major = "Biology";

UPDATE student 
SET major ='Comp Sci'
WHERE major = 'Computer Science';

UPDATE student
SET major = "Biochemistry"
WHERE major ="Bio" OR major="Chemistry";

UPDATE student
SET major = 'Comp Sci'
WHERE student_id = 4;

#To delete specific rows:

DELETE FROM student
WHERE student_id=5;

DELETE FROM student 
WHERE name='Kate' AND major='sociology'; 



