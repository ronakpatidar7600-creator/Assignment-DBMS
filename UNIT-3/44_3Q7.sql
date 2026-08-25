SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_publishers IS
        SELECT pub_id, pub_name
        FROM publisher
        ORDER BY pub_id;

    CURSOR c_books (
        p_pub_id NUMBER
    ) IS
        SELECT book_id, title, price
        FROM book
        WHERE pub_id = p_pub_id
        ORDER BY book_id;

BEGIN
    FOR r_pub IN c_publishers
    LOOP
        DBMS_OUTPUT.PUT_LINE(r_pub.pub_name);

        FOR r_book IN c_books(r_pub.pub_id)
        LOOP
            DBMS_OUTPUT.PUT_LINE(
                '   -> ' || r_book.book_id ||
                ' | ' || r_book.title ||
                ' | Price: ' || r_book.price
            );
        END LOOP;
    END LOOP;
END;
/

-- OUTPUT:
-- Oxford Press
--    -> 106 | Computer Networks | Price: 780
--    -> 108 | Oracle SQL Handbook | Price: 640
--    -> 112 | Cloud Computing Essentials | Price: 880
-- Tech Bharat Pub
--    -> 102 | Let Us Learn PL/SQL | Price: 420.5
--    -> 105 | Python for Beginners | Price: 350
-- McGraw Hill
--    -> 101 | Database System Concepts | Price: 850
--    -> 103 | Operating System Design | Price: 690
--    -> 104 | Java Complete Reference | Price: 975
-- Vidya Prakashan
--    -> 107 | Data Structures in C | Price: 560
--    -> 110 | Web Technology Basics | Price: 295
-- Pearson Global
--    -> 109 | Software Engineering | Price: 520
--    -> 111 | Advanced DBMS | Price: 1150