SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books (
        p_min_price NUMBER,
        p_max_price NUMBER
    ) IS
        SELECT book_id, title, price
        FROM book
        WHERE price BETWEEN p_min_price AND p_max_price;

BEGIN
    FOR r_book IN c_books(&min_price, &max_price)
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | Title: ' || r_book.title ||
            ' | Price: ' || r_book.price
        );
    END LOOP;
END;
/

-- TEST:
-- Enter value for min_price: 300
-- Enter value for max_price: 700

-- OUTPUT:
-- Book ID: 102 | Title: Let Us Learn PL/SQL | Price: 420.5
-- Book ID: 103 | Title: Operating System Design | Price: 690
-- Book ID: 105 | Title: Python for Beginners | Price: 350
-- Book ID: 107 | Title: Data Structures in C | Price: 560
-- Book ID: 108 | Title: Oracle SQL Handbook | Price: 640
-- Book ID: 109 | Title: Software Engineering | Price: 520