-- Employees
INSERT INTO employee VALUES ('Alice', 'Maple Street', 'New York');
INSERT INTO employee VALUES ('Bob', 'Oak Avenue', 'Los Angeles');
INSERT INTO employee VALUES ('Charlie', 'Maple Street', 'New York');
INSERT INTO employee VALUES ('David', 'Elm Street', 'Chicago');
INSERT INTO employee VALUES ('Eve', 'Pine Street', 'New York');

-- Works
INSERT INTO works VALUES ('Alice', 'First Bank Corporation', 12000);
INSERT INTO works VALUES ('Bob', 'Small Bank Corporation', 9000);
INSERT INTO works VALUES ('Charlie', 'First Bank Corporation', 11000);
INSERT INTO works VALUES ('David', 'Small Bank Corporation', 8000);
INSERT INTO works VALUES ('Eve', 'Big Bank Corporation', 15000);

-- Companies
INSERT INTO company VALUES ('First Bank Corporation', 'New York');
INSERT INTO company VALUES ('Small Bank Corporation', 'Los Angeles');
INSERT INTO company VALUES ('Small Bank Corporation', 'Chicago');
INSERT INTO company VALUES ('Big Bank Corporation', 'New York');
INSERT INTO company VALUES ('Big Bank Corporation', 'San Francisco');

-- Manages
INSERT INTO manages VALUES ('Alice', 'Charlie');
INSERT INTO manages VALUES ('Bob', 'David');
INSERT INTO manages VALUES ('Charlie', 'Eve');
INSERT INTO manages VALUES ('David', 'Eve');
INSERT INTO manages VALUES ('Eve', 'Alice');
