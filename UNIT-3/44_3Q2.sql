SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books (p_pub_name VARCHAR2) IS
        SELECT b.title, b.price
        FROM book b
        JOIN publisher p
        ON b.pub_id = p.pub_id
        WHERE UPPER(p.pub_name) = UPPER(p_pub_name);

BEGIN
    FOR r_book IN c_books('&pub_name')
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Title: ' || r_book.title ||
            ' | Price: ' || r_book.price
        );
    END LOOP;
END;
/

-- TEST:
-- Enter value for pub_name: McGraw Hill

-- OUTPUT:
-- Title: Database System Concepts | Price: 850
-- Title: Operating System Design | Price: 690
-- Title: Java Complete Reference | Price: 975