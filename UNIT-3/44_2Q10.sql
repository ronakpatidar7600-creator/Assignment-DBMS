SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_low_stock IS
        SELECT book_id, title, stock
        FROM book
        WHERE stock < 5;

    v_count NUMBER := 0;

BEGIN
    FOR r_book IN c_low_stock
    LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | Title: ' || r_book.title ||
            ' | Stock: ' || r_book.stock ||
            ' | REORDER'
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Total books requiring reorder: ' || v_count
    );
END;
/

-- OUTPUT:
-- Book ID: 102 | Title: Let Us Learn PL/SQL | Stock: 4 | REORDER
-- Book ID: 105 | Title: Python for Beginners | Stock: 3 | REORDER
-- Book ID: 107 | Title: Data Structures in C | Stock: 2 | REORDER
-- Book ID: 110 | Title: Web Technology Basics | Stock: 1 | REORDER
-- Book ID: 112 | Title: Cloud Computing Essentials | Stock: 4 | REORDER
-- Total books requiring reorder: 5