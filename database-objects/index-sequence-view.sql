Index, Sequence and View

Consider the given relational table:

employee(empno , empname, designation, city, salary, zipcode, county)

Write SQL queries for the following

1. Create a sequence used to generate employee numbers for the empno column of the emp table.

2. Create an Index on the county.

3. Find the country whose zipcode = 071 and check whether the query uses the Index and write your observation.

4. Create a view for employees having salary < 50000 and stays in ‘Mumbai’
5. Display a Count of employees who stays in ‘Mumbai’
6. Find average salary of employees of a created view
7. Display employee names who stays on same street of a view
Give everything insert values then solve queries and sample output

Solution -
1. Enter MySQL

sudo mysql

---

🔹 2. Create a Database and Use It

CREATE DATABASE company;
USE company;
---

🔹 3. Create employee Table

CREATE TABLE employee (
    empno INT PRIMARY KEY AUTO_INCREMENT,
    empname VARCHAR(50),
    designation VARCHAR(50),
    city VARCHAR(50),
    salary INT,
    zipcode VARCHAR(10),
    county VARCHAR(50)
);

> 🔸 MySQL doesn't use SEQUENCE, instead we use AUTO_INCREMENT on empno.

---

🔹 4. Insert Sample Data

INSERT INTO employee (empname, designation, city, salary, zipcode, county)
VALUES 
('Raj Sharma', 'Manager', 'Mumbai', 48000, '071', 'Andheri'),
('Amit Joshi', 'Developer', 'Delhi', 60000, '110', 'Rohini'),
('Sneha Kapoor', 'Tester', 'Mumbai', 45000, '071', 'Andheri'),
('Neha Jain', 'Designer', 'Mumbai', 55000, '072', 'Bandra'),
('Vikas Rao', 'Manager', 'Pune', 70000, '411', 'Kothrud'),
('Nikhil Mehta', 'Intern', 'Mumbai', 30000, '071', 'Andheri');

---

🔹 5. Create an Index on county

CREATE INDEX idx_county ON employee(county);
---

🔹 6. Find the County Where zipcode = '071'

SELECT county FROM employee WHERE zipcode = '071';

👉 To check if index is used:

EXPLAIN SELECT county FROM employee WHERE zipcode = '071';

Observation: Index not used because we queried on zipcode, not county.
---

🔹 7. Create a View for Employees in Mumbai with Salary < 50000

CREATE VIEW mumbai_low_salary AS
SELECT * FROM employee
WHERE city = 'Mumbai' AND salary < 50000;
---

🔹 8. Count of Employees in Mumbai

SELECT COUNT(*) AS mumbai_count
FROM employee
WHERE city = 'Mumbai';
---

🔹 9. Average Salary in the View

SELECT AVG(salary) AS avg_mumbai_salary
FROM mumbai_low_salary;
---

🔹 10. Employees on Same County (Street)

SELECT DISTINCT e.empname
FROM employee e
JOIN mumbai_low_salary v
  ON e.county = v.county
WHERE e.empno != v.empno;


