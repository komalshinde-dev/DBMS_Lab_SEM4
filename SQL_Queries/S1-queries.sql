
1. Employees working for First Bank Corporation

SELECT employee_name
FROM works
WHERE company_name = 'First Bank Corporation';

2. Names and cities of residence of employees at First Bank

SELECT e.employee_name, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation';

3. Employees at First Bank earning more than 10,000

SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation' AND w.salary > 10000;

4. Employees living in the same city as the company

SELECT DISTINCT e.employee_name
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
JOIN company c ON w.company_name = c.company_name
WHERE e.city = c.city;

5. Employees living on same street and city as their managers

SELECT e.employee_name
FROM employee e
JOIN manages m ON e.employee_name = m.employee_name
JOIN employee mng ON m.manager_name = mng.employee_name
WHERE e.city = mng.city AND e.street = mng.street;

6. Employees not working for First Bank Corporation

SELECT employee_name
FROM works
WHERE company_name <> 'First Bank Corporation';

7. Employees earning more than every Small Bank employee

SELECT DISTINCT w1.employee_name
FROM works w1
WHERE w1.salary > ALL (
    SELECT salary
    FROM works
    WHERE company_name = 'Small Bank Corporation'
);

8. Companies in all cities where Small Bank is located

SELECT DISTINCT c1.company_name
FROM company c1
WHERE NOT EXISTS (
    SELECT city
    FROM company c2
    WHERE c2.company_name = 'Small Bank Corporation'
    EXCEPT
    SELECT city
    FROM company c3
    WHERE c3.company_name = c1.company_name
);

9. Employees earning more than their company's average salary

SELECT w.employee_name
FROM works w
JOIN (
    SELECT company_name, AVG(salary) AS avg_salary
    FROM works
    GROUP BY company_name
) avg_table ON w.company_name = avg_table.company_name
WHERE w.salary > avg_table.avg_salary;

10. Company with the most employees

SELECT company_name
FROM works
GROUP BY company_name
ORDER BY COUNT(DISTINCT employee_name) DESC
LIMIT 1;

11. Company with the smallest payroll

SELECT company_name
FROM works
GROUP BY company_name
ORDER BY SUM(salary) ASC
LIMIT 1;

12. Companies with avg salary > First Bank's avg

SELECT w.company_name
FROM works w
GROUP BY w.company_name
HAVING AVG(w.salary) > (
    SELECT AVG(salary)
    FROM works
    WHERE company_name = 'First Bank Corporation'
);
