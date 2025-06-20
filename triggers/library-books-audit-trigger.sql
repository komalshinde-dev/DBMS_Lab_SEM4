Database Trigger
Create a Library database with the schema
Books(AccNo, Title, Author, Publisher, Count).
a. Create a table Library_Audit with same fields as of Books and Date and
status column
b. Create a before trigger to insert records into Librry_Audit table
if there is deletion in Books table, insert date of deletion and status as deleted
Create a after trigger to insert records into Librry_Audit table if there is updation in Books table , insert date of updation and status as updated 


-- Drop tables if they exist (ignore errors if not exist)
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Library_Audit';
EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;
/

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Books';
EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;
/

-- Create Books Table
CREATE TABLE Books (
    AccNo NUMBER PRIMARY KEY,
    Title VARCHAR2(100),
    Author VARCHAR2(100),
    Publisher VARCHAR2(100),
    Count NUMBER
);

-- Create Library_Audit Table
CREATE TABLE Library_Audit (
    AccNo NUMBER,
    Title VARCHAR2(100),
    Author VARCHAR2(100),
    Publisher VARCHAR2(100),
    Count NUMBER,
    ActionDate DATE,
    Status VARCHAR2(20)
);

-- BEFORE DELETE Trigger
CREATE OR REPLACE TRIGGER trg_before_delete_books
BEFORE DELETE ON Books
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (AccNo, Title, Author, Publisher, Count, ActionDate, Status)
    VALUES (:OLD.AccNo, :OLD.Title, :OLD.Author, :OLD.Publisher, :OLD.Count, SYSDATE, 'deleted');
END;
/

-- AFTER UPDATE Trigger
CREATE OR REPLACE TRIGGER trg_after_update_books
AFTER UPDATE ON Books
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit (AccNo, Title, Author, Publisher, Count, ActionDate, Status)
    VALUES (:NEW.AccNo, :NEW.Title, :NEW.Author, :NEW.Publisher, :NEW.Count, SYSDATE, 'updated');
END;
/

-- Insert Sample Data
INSERT INTO Books VALUES (101, 'The Alchemist', 'Paulo Coelho', 'HarperOne', 5);
INSERT INTO Books VALUES (102, '1984', 'George Orwell', 'Secker & Warburg', 3);
INSERT INTO Books VALUES (103, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott', 4);
COMMIT;

-- Perform Update Operation
UPDATE Books SET Count = 6 WHERE AccNo = 101;
COMMIT;

-- Perform Delete Operation
DELETE FROM Books WHERE AccNo = 102;
COMMIT;

-- View Audit Table
SELECT * FROM Library_Audit;
