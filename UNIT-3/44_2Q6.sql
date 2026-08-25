SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books IS
        SELECT book_id, title, price, stock
        FROM book;

    v_value NUMBER(12,2);
    v_total NUMBER(12,2) := 0;
BEGIN
    FOR r_book IN c_books
    LOOP
        v_value := r_book.price * r_book.stock;
        v_total := v_total + v_value;

        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | ' || r_book.title ||
            ' | Value: ' || v_value
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Grand Total Stock Value: ' || v_total);
END;
/

-- OUTPUT:
-- Book ID: 101 | Database System Concepts | Value: 10200
-- Book ID: 102 | Let Us Learn PL/SQL | Value: 1682
-- Book ID: 103 | Operating System Design | Value: 5520
-- Book ID: 104 | Java Complete Reference | Value: 14625
-- Book ID: 105 | Python for Beginners | Value: 1050
-- Book ID: 106 | Computer Networks | Value: 4680
-- Book ID: 107 | Data Structures in C | Value: 1120
-- Book ID: 108 | Oracle SQL Handbook | Value: 5760
-- Book ID: 109 | Software Engineering | Value: 3640
-- Book ID: 110 | Web Technology Basics | Value: 295
-- Book ID: 111 | Advanced DBMS | Value: 5750
-- Book ID: 112 | Cloud Computing Essentials | Value: 3520
-- Grand Total Stock Value: 57242