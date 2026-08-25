SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books IS
        SELECT book_id, title, price
        FROM book
        ORDER BY price DESC;

    v_book_id book.book_id%TYPE;
    v_title   book.title%TYPE;
    v_price   book.price%TYPE;

BEGIN
    OPEN c_books;

    LOOP
        FETCH c_books INTO v_book_id, v_title, v_price;

        EXIT WHEN c_books%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            c_books%ROWCOUNT || '. ' ||
            v_book_id || ' | ' ||
            v_title || ' | Price: ' || v_price
        );

        EXIT WHEN c_books%ROWCOUNT = 5;
    END LOOP;

    CLOSE c_books;
END;
/

-- OUTPUT:
-- 1. 111 | Advanced DBMS | Price: 1150
-- 2. 104 | Java Complete Reference | Price: 975
-- 3. 112 | Cloud Computing Essentials | Price: 880
-- 4. 101 | Database System Concepts | Price: 850
-- 5. 106 | Computer Networks | Price: 780