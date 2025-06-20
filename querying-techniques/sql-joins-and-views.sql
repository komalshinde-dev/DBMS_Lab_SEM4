SQL Joins

Consider the given database schema:

Student (studentid , studentname,instructorid,studentcity)

Instructor(instructorid,Instructorname,instructorcity,specialization)
Use all types of Joins

1. Find the instructor of each student.

2. Find the student who is not having any instructor

3. Find the student who is not having any instructor as well as instructor who is not having student.

4. Find the students whose instructor’s specialization is computer.

5. Create a view containing the total number of students whose instructor belongs to “Pune”
Insert values first then solve queries

Solution 
1. Create and Insert Values

-- Create tables
CREATE TABLE Instructor (
    instructorid INT PRIMARY KEY,
    instructorname VARCHAR(50),
    instructorcity VARCHAR(50),
    specialization VARCHAR(50)
);

CREATE TABLE Student (
    studentid INT PRIMARY KEY,
    studentname VARCHAR(50),
    instructorid INT,
    studentcity VARCHAR(50),
    FOREIGN KEY (instructorid) REFERENCES Instructor(instructorid)
);

-- Insert sample data into Instructor
INSERT INTO Instructor VALUES 
(1, 'Dr. Sharma', 'Pune', 'Computer'),
(2, 'Dr. Mehta', 'Mumbai', 'Math'),
(3, 'Dr. Reddy', 'Delhi', 'Physics'),
(4, 'Dr. Khan', 'Pune', 'Computer');

-- Insert sample data into Student
INSERT INTO Student VALUES 
(101, 'Amit', 1, 'Nagpur'),
(102, 'Priya', 2, 'Pune'),
(103, 'Raj', NULL, 'Mumbai'),        -- No instructor
(104, 'Neha', 4, 'Delhi'),
(105, 'Sameer', NULL, 'Bangalore');  -- No instructor


---

2. SQL Queries Using Different Types of Joins


---

Query 1: Find the instructor of each student (INNER JOIN)

SELECT s.studentname, i.instructorname
FROM Student s
INNER JOIN Instructor i ON s.instructorid = i.instructorid;


---

Query 2: Find the students who are not having any instructor (LEFT JOIN + WHERE NULL)

SELECT s.studentname
FROM Student s
LEFT JOIN Instructor i ON s.instructorid = i.instructorid
WHERE i.instructorid IS NULL;


---

Query 3: Find students without instructors AND instructors without students (FULL OUTER JOIN)

> Note: FULL OUTER JOIN is not supported in some databases like MySQL directly. Here's a simulated version using UNION.



-- Students with no instructors
SELECT s.studentname, NULL AS instructorname
FROM Student s
LEFT JOIN Instructor i ON s.instructorid = i.instructorid
WHERE i.instructorid IS NULL

UNION

-- Instructors with no students
SELECT NULL AS studentname, i.instructorname
FROM Instructor i
LEFT JOIN Student s ON i.instructorid = s.instructorid
WHERE s.studentid IS NULL;


---

Query 4: Find students whose instructor’s specialization is 'Computer' (INNER JOIN + WHERE)

SELECT s.studentname
FROM Student s
INNER JOIN Instructor i ON s.instructorid = i.instructorid
WHERE i.specialization = 'Computer';


---

Query 5: Create a view - Total number of students whose instructor is from Pune

CREATE VIEW PuneInstructorStudents AS
SELECT COUNT(*) AS total_students
FROM Student s
JOIN Instructor i ON s.instructorid = i.instructorid
WHERE i.instructorcity = 'Pune';

To view the result of the view:

SELECT * FROM PuneInstructorStudents;




