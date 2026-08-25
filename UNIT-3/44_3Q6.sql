SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_member_books (
        p_member_id NUMBER
    ) IS
        SELECT b.book_id,
               b.title,
               bi.issue_date
        FROM book_issue bi
        JOIN book b
            ON bi.book_id = b.book_id
        JOIN lib_member m
            ON bi.member_id = m.member_id
        WHERE m.member_id = p_member_id
        ORDER BY bi.issue_date;

BEGIN
    FOR r_book IN c_member_books(&member_id)
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Book ID: ' || r_book.book_id ||
            ' | Title: ' || r_book.title ||
            ' | Issue Date: ' ||
            TO_CHAR(r_book.issue_date, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/

-- TEST:
-- Enter value for member_id: 2

-- OUTPUT:
-- Book ID: 104 | Title: Java Complete Reference | Issue Date: 03-JUN-2026
-- Book ID: 108 | Title: Oracle SQL Handbook | Issue Date: 18-JUN-2026