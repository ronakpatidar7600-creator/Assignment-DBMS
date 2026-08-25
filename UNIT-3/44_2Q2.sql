SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books IS
        SELECT book_id, title, price
        FROM book;
BEGIN
    FOR r_book IN c_books
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | Title: ' || r_book.title ||
            ' | Price: ' || r_book.price
        );
    END LOOP;

    -- Oracle automatically performs OPEN, FETCH, EXIT, and CLOSE.
END;
/

-- OUTPUT:
-- Book ID: 101 | Title: Database System Concepts | Price: 850
-- Book ID: 102 | Title: Let Us Learn PL/SQL | Price: 420.5
-- Book ID: 103 | Title: Operating System Design | Price: 690
-- Book ID: 104 | Title: Java Complete Reference | Price: 975
-- Book ID: 105 | Title: Python for Beginners | Price: 350
-- Book ID: 106 | Title: Computer Networks | Price: 780
-- Book ID: 107 | Title: Data Structures in C | Price: 560
-- Book ID: 108 | Title: Oracle SQL Handbook | Price: 640
-- Book ID: 109 | Title: Software Engineering | Price: 520
-- Book ID: 110 | Title: Web Technology Basics | Price: 295
-- Book ID: 111 | Title: Advanced DBMS | Price: 1150
-- Book ID: 112 | Title: Cloud Computing Essentials | Price: 880