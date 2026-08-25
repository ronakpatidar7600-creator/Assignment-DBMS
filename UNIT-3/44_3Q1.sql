SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books (p_category VARCHAR2) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_category);

BEGIN
    FOR r_book IN c_books('&category')
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | Title: ' || r_book.title ||
            ' | Price: ' || r_book.price
        );
    END LOOP;
END;
/

-- TEST 1:
-- Enter value for category: Database

-- OUTPUT:
-- Book ID: 101 | Title: Database System Concepts | Price: 850
-- Book ID: 102 | Title: Let Us Learn PL/SQL | Price: 420.5
-- Book ID: 108 | Title: Oracle SQL Handbook | Price: 640
-- Book ID: 111 | Title: Advanced DBMS | Price: 1150

-- TEST 2:
-- Enter value for category: Programming

-- OUTPUT:
-- Book ID: 104 | Title: Java Complete Reference | Price: 975
-- Book ID: 105 | Title: Python for Beginners | Price: 350
-- Book ID: 107 | Title: Data Structures in C | Price: 560