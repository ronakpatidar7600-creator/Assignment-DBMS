SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_category (
        p_category VARCHAR2
    ) IS
        SELECT book_id, title, price
        FROM book
        WHERE UPPER(category) = UPPER(p_category)
        FOR UPDATE;

    v_old_price book.price%TYPE;
    v_new_price book.price%TYPE;

BEGIN
    FOR r_book IN c_category('&category')
    LOOP
        v_old_price := r_book.price;
        v_new_price := r_book.price * 1.10;

        UPDATE book
        SET price = v_new_price
        WHERE CURRENT OF c_category;

        DBMS_OUTPUT.PUT_LINE(
            'Title: ' || r_book.title ||
            ' | Old Price: ' || v_old_price ||
            ' | New Price: ' || v_new_price
        );
    END LOOP;

    COMMIT;
END;
/

-- TEST:
-- Enter value for category: Database

-- OUTPUT:
-- Title: Database System Concepts | Old Price: 850 | New Price: 935
-- Title: Let Us Learn PL/SQL | Old Price: 420.5 | New Price: 462.55
-- Title: Oracle SQL Handbook | Old Price: 640 | New Price: 704
-- Title: Advanced DBMS | Old Price: 1150 | New Price: 1265