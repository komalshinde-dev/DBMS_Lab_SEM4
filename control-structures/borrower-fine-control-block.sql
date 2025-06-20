PL/SQL block
Create a database with following schemas
Borrower(Rollin, Name, DateofIssue, NameofBook, Status) &
Fine(Roll_no,Date,Amt)
 1.Write a PL/SQL block to accept input for Borrower table.
2.Write a PL/SQL block using control structures to calculate fine by usingthe following rules:
a. check the number of days (from date of issue), if days are
between 15 to 30 then fine
amount will be Rs 5 per day
b. If no. of days>30, per day fine will be Rs 50 per day
c. for days less than 30, Rs. 5 per day.
After submitting the book, status will change from I to R. If condition of fine is true, then details will be stored into fine table


Solution 
Step 1: Open Oracle Tool
Choose any of the following:
SQL Developer (GUI-based)
SQL*Plus (command-line)
Oracle APEX (web-based)

Step 2: Connect to Your Oracle Database
In SQL Developer:
Click + icon in "Connections"
Enter:
Username: (e.g., system, or your schema user)
Password

Step 3: Create the Tables

Copy-paste and run the following in a worksheet:

CREATE TABLE Borrower (
    Rollin NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    DateofIssue DATE,
    NameofBook VARCHAR2(100),
    Status CHAR(1) CHECK (Status IN ('I', 'R'))
);

CREATE TABLE Fine (
    Roll_no NUMBER,
    Date DATE,
    Amt NUMBER(10, 2)
);

Click the green play button or press F5 to run.


---

Step 4: Insert Sample Data Using PL/SQL Block

Paste the following block into your worksheet and run:

SET SERVEROUTPUT ON;

BEGIN
    INSERT INTO Borrower (Rollin, Name, DateofIssue, NameofBook, Status)
    VALUES (101, 'John Doe', TO_DATE('2025-05-01', 'YYYY-MM-DD'), 'Database Systems', 'I');

    DBMS_OUTPUT.PUT_LINE('Borrower record inserted.');
END;
/

✅ You should see: Borrower record inserted.


---

Step 5: Calculate Fine and Update Status Using PL/SQL

Now run this block:

SET SERVEROUTPUT ON;

DECLARE
    v_rollin Borrower.Rollin%TYPE := 101; -- Replace with your roll number
    v_dateofissue DATE;
    v_days NUMBER;
    v_fine_amt NUMBER := 0;
    v_status CHAR(1);
BEGIN
    SELECT DateofIssue, Status
    INTO v_dateofissue, v_status
    FROM Borrower
    WHERE Rollin = v_rollin;

    IF v_status = 'I' THEN
        v_days := TRUNC(SYSDATE - v_dateofissue);

        IF v_days > 30 THEN
            v_fine_amt := (v_days - 30) * 50 + (15 * 5);
        ELSIF v_days > 15 THEN
            v_fine_amt := (v_days - 15) * 5;
        ELSE
            v_fine_amt := 0;
        END IF;

        -- Update status to 'R'
        UPDATE Borrower
        SET Status = 'R'
        WHERE Rollin = v_rollin;

        -- Insert fine if applicable
        IF v_fine_amt > 0 THEN
            INSERT INTO Fine (Roll_no, Date, Amt)
            VALUES (v_rollin, SYSDATE, v_fine_amt);
        END IF;

        DBMS_OUTPUT.PUT_LINE('Fine Calculated: Rs ' || v_fine_amt);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Book already returned.');
    END IF;
END;
/

📌 Make sure SET SERVEROUTPUT ON is enabled before you run the block. It shows output messages.


---

Step 6: Check the Tables

Check the Borrower table (status should be 'R'):

SELECT * FROM Borrower;

Check the Fine table (should have fine if applicable):

SELECT * FROM Fine;


---

📝 Tips

Always end PL/SQL blocks with / on a new line to execute.

If you're running multiple statements, use F5 (Run Script) instead of just the green play button.

Adjust roll number and date inputs to simulate different scenarios.


