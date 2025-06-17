Consider the given Database Schema:

employee (employee-name, street, city)

works (employee-name, company-name, salary)

company (company-name, city)

manages (employee-name, manager-name)




CREATE TABLE employee (
    employee_name VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE works (
    employee_name VARCHAR(50),
    company_name VARCHAR(50),
    salary INT
);

CREATE TABLE company (
    company_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE manages (
    employee_name VARCHAR(50),
    manager_name VARCHAR(50)
);
