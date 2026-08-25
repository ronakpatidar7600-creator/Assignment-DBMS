SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_database_books IS
        SELECT book_id, title, stock
        FROM book
        WHERE category = 'Database'
        FOR UPDATE;

    v_old_stock book.stock%TYPE;
    v_new_stock book.stock%TYPE;

BEGIN
    FOR r_book IN c_database_books
    LOOP
        v_old_stock := r_book.stock;
        v_new_stock := r_book.stock + 10;

        UPDATE book
        SET stock = v_new_stock
        WHERE CURRENT OF c_database_books;

        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | ' || r_book.title ||
            ' | Old Stock: ' || v_old_stock ||
            ' | New Stock: ' || v_new_stock
        );
    END LOOP;

    COMMIT;
END;
/

-- OUTPUT:
-- Book ID: 101 | Database System Concepts | Old Stock: 12 | New Stock: 22
-- Book ID: 102 | Let Us Learn PL/SQL | Old Stock: 4 | New Stock: 14
-- Book ID: 108 | Oracle SQL Handbook | Old Stock: 9 | New Stock: 19
-- Book ID: 111 | Advanced DBMS | Old Stock: 5 | New Stock: 15