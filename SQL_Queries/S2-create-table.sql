

Step 1: Create Tables with Primary Keys

CREATE TABLE account (
    acc_no INT PRIMARY KEY,
    branch_name VARCHAR(50),
    balance DECIMAL(10, 2)
);

CREATE TABLE depositor (
    cust_name VARCHAR(50),
    acc_no INT,
    PRIMARY KEY (cust_name, acc_no),
    FOREIGN KEY (acc_no) REFERENCES account(acc_no)
);

CREATE TABLE loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(50),
    amount DECIMAL(10, 2)
);

CREATE TABLE borrower (
    cust_name VARCHAR(50),
    loan_no INT,
    PRIMARY KEY (cust_name, loan_no),
    FOREIGN KEY (loan_no) REFERENCES loan(loan_no)
);


---
