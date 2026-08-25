SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books (
        p_cat VARCHAR2 DEFAULT 'Database'
    ) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_cat);

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- DEFAULT: Database ---');

    FOR r_book IN c_books
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | Title: ' || r_book.title ||
            ' | Price: ' || r_book.price
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('--- ARGUMENT: Networking ---');

    FOR r_book IN c_books('Networking')
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | Title: ' || r_book.title ||
            ' | Price: ' || r_book.price
        );
    END LOOP;
END;
/

-- OUTPUT:
-- --- DEFAULT: Database ---
-- Book ID: 101 | Title: Database System Concepts | Price: 850
-- Book ID: 102 | Title: Let Us Learn PL/SQL | Price: 420.5
-- Book ID: 108 | Title: Oracle SQL Handbook | Price: 640
-- Book ID: 111 | Title: Advanced DBMS | Price: 1150
-- --- ARGUMENT: Networking ---
-- Book ID: 106 | Title: Computer Networks | Price: 780
-- Book ID: 112 | Title: Cloud Computing Essentials | Price: 880