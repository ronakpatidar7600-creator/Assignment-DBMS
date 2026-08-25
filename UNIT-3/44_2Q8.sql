SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_not_returned IS
        SELECT issue_id, book_id, issue_date
        FROM book_issue
        WHERE return_date IS NULL;

    v_issue_id   book_issue.issue_id%TYPE;
    v_book_id    book_issue.book_id%TYPE;
    v_issue_date book_issue.issue_date%TYPE;

BEGIN
    OPEN c_not_returned;

    LOOP
        FETCH c_not_returned
        INTO v_issue_id, v_book_id, v_issue_date;

        EXIT WHEN c_not_returned%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Issue ID: ' || v_issue_id ||
            ' | Book ID: ' || v_book_id ||
            ' | Issue Date: ' ||
            TO_CHAR(v_issue_date, 'DD-MM-YYYY')
        );
    END LOOP;

    IF c_not_returned%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('All books returned');
    END IF;

    CLOSE c_not_returned;
END;
/

-- OUTPUT:
-- Issue ID: 5002 | Book ID: 104 | Issue Date: 03-06-2026
-- Issue ID: 5004 | Book ID: 107 | Issue Date: 10-06-2026
-- Issue ID: 5006 | Book ID: 103 | Issue Date: 15-06-2026
-- Issue ID: 5008 | Book ID: 106 | Issue Date: 01-07-2026
-- Issue ID: 5010 | Book ID: 112 | Issue Date: 09-07-2026
-- Issue ID: 5012 | Book ID: 109 | Issue Date: 20-07-2026