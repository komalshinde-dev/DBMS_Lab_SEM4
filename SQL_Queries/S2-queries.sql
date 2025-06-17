Queries as requested


---

3. Find customers having loan less than 1 lac (100,000)

SELECT DISTINCT b.cust_name
FROM borrower b
JOIN loan l ON b.loan_no = l.loan_no
WHERE l.amount < 100000;


---

4. Display account number and customer name starting with ‘P’

SELECT d.acc_no, d.cust_name
FROM depositor d
WHERE d.cust_name LIKE 'P%';


---

5. Display name of the depositor with balance

SELECT d.cust_name, a.balance
FROM depositor d
JOIN account a ON d.acc_no = a.acc_no;


---

6. Find names of all customers who have a loan at the ‘Redwood branch’

SELECT DISTINCT b.cust_name
FROM borrower b
JOIN loan l ON b.loan_no = l.loan_no
WHERE l.branch_name = 'Redwood branch';


---

7. Find all customers who have an account and loan or both

SELECT DISTINCT cust_name FROM (
    SELECT cust_name FROM depositor
    UNION
    SELECT cust_name FROM borrower
) AS all_customers;


---

8. Find all customers who do not have loan

SELECT DISTINCT d.cust_name
FROM depositor d
LEFT JOIN borrower b ON d.cust_name = b.cust_name
WHERE b.cust_name IS NULL;


---

9. Find average account balance at each branch

SELECT branch_name, AVG(balance) AS avg_balance
FROM account
GROUP BY branch_name;


---

10. Find the name of borrower having maximum loan amount

SELECT b.cust_name
FROM borrower b
JOIN loan l ON b.loan_no = l.loan_no
WHERE l.amount = (
    SELECT MAX(amount) FROM loan
);



