
-- Insert accounts
INSERT INTO account (acc_no, branch_name, balance) VALUES
(101, 'Downtown', 50000.00),
(102, 'Redwood branch', 75000.00),
(103, 'Downtown', 200000.00),
(104, 'Uptown', 120000.00),
(105, 'Redwood branch', 30000.00);

-- Insert depositors
INSERT INTO depositor (cust_name, acc_no) VALUES
('Alice', 101),
('Bob', 102),
('Charlie', 103),
('David', 104),
('Paul', 105),
('Peter', 105);

-- Insert loans
INSERT INTO loan (loan_no, branch_name, amount) VALUES
(201, 'Downtown', 150000.00),
(202, 'Redwood branch', 80000.00),
(203, 'Uptown', 250000.00),
(204, 'Redwood branch', 50000.00);

-- Insert borrowers
INSERT INTO borrower (cust_name, loan_no) VALUES
('Alice', 201),
('Bob', 202),
('Charlie', 203),
('Paul', 204);


---

