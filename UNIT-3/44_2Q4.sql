SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_expensive_books IS
        SELECT book_id, title, price
        FROM book
        WHERE price > 500;

    v_book_id book.book_id%TYPE;
    v_title   book.title%TYPE;
    v_price   book.price%TYPE;
BEGIN
    OPEN c_expensive_books;

    LOOP
        FETCH c_expensive_books INTO v_book_id, v_title, v_price;

        EXIT WHEN c_expensive_books%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            c_expensive_books%ROWCOUNT || '. ' ||
            v_book_id || ' | ' ||
            v_title || ' | Price: ' || v_price
        );
    END LOOP;

    CLOSE c_expensive_books;
END;
/

-- OUTPUT:
-- 1. 101 | Database System Concepts | Price: 850
-- 2. 103 | Operating System Design | Price: 690
-- 3. 104 | Java Complete Reference | Price: 975
-- 4. 106 | Computer Networks | Price: 780
-- 5. 107 | Data Structures in C | Price: 560
-- 6. 108 | Oracle SQL Handbook | Price: 640
-- 7. 109 | Software Engineering | Price: 520
-- 8. 111 | Advanced DBMS | Price: 1150
-- 9. 112 | Cloud Computing Essentials | Price: 880