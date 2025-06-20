Cursors 
Write a block in PL/SQL to print a report which shows that, the employee id, name, hire date, and the incentive amount they achieved according to their working experiences, who joined in the month of current date. Use explicit cursor

Solution -
Create the employees Table
-- Drop table if it already exists
DROP TABLE employees;

-- Create the employees table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    hire_date DATE
);

2. Insert Sample Data
-- Insert sample employee data
INSERT INTO employees VALUES (101, 'Alice', 'Johnson', TO_DATE('2020-05-15', 'YYYY-MM-DD'));
INSERT INTO employees VALUES (102, 'Bob', 'Smith', TO_DATE('2019-08-20', 'YYYY-MM-DD'));
INSERT INTO employees VALUES (103, 'Charlie', 'Brown', TO_DATE('2021-05-10', 'YYYY-MM-DD'));
INSERT INTO employees VALUES (104, 'Diana', 'Evans', TO_DATE('2022-11-25', 'YYYY-MM-DD'));
INSERT INTO employees VALUES (105, 'Ethan', 'Clark', TO_DATE('2018-05-05', 'YYYY-MM-DD'));

-- Commit the changes
COMMIT;

✅ 3. PL/SQL Block Using Explicit Cursor


SET SERVEROUTPUT ON;

DECLARE
    -- Cursor to fetch employees hired in the current month (any year)
    CURSOR emp_cursor IS
        SELECT employee_id, first_name || ' ' || last_name AS full_name, hire_date
        FROM employees
        WHERE TO_CHAR(hire_date, 'MM') = TO_CHAR(SYSDATE, 'MM');

    -- Record variable for cursor
    emp_record emp_cursor%ROWTYPE;

    -- Variable to store years of experience
    years_of_experience NUMBER;

    -- Variable to store incentive amount
    incentive_amount NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee Report for Join Month: ' || TO_CHAR(SYSDATE, 'Month'));
    DBMS_OUTPUT.PUT_LINE(RPAD('ID', 10) || RPAD('Name', 25) || RPAD('Hire Date', 15) || 'Incentive');

    -- Open cursor
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Calculate experience in years
        years_of_experience := FLOOR(MONTHS_BETWEEN(SYSDATE, emp_record.hire_date) / 12);

        -- Incentive logic: 1000 per year of experience
        incentive_amount := years_of_experience * 1000;

        -- Display the result
        DBMS_OUTPUT.PUT_LINE(
            RPAD(emp_record.employee_id, 10) ||
            RPAD(emp_record.full_name, 25) ||
            RPAD(TO_CHAR(emp_record.hire_date, 'DD-MON-YYYY'), 15) ||
            incentive_amount
        );
    END LOOP;
    CLOSE emp_cursor;
END;
/



