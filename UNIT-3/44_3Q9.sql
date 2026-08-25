SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_issues (
        p_month NUMBER
    ) IS
        SELECT bi.issue_id,
               b.book_id,
               b.title,
               bi.issue_date
        FROM book_issue bi
        JOIN book b
            ON bi.book_id = b.book_id
        WHERE EXTRACT(MONTH FROM bi.issue_date) = p_month
          AND EXTRACT(YEAR FROM bi.issue_date) = 2026
        ORDER BY bi.issue_date;

BEGIN
    FOR r_issue IN c_issues(&month_no)
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Issue ID: ' || r_issue.issue_id ||
            ' | Book ID: ' || r_issue.book_id ||
            ' | Title: ' || r_issue.title ||
            ' | Issue Date: ' ||
            TO_CHAR(r_issue.issue_date, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/

-- TEST:
-- Enter value for month_no: 6

-- OUTPUT:
-- Issue ID: 5001 | Book ID: 101 | Title: Database System Concepts | Issue Date: 01-JUN-2026
-- Issue ID: 5002 | Book ID: 104 | Title: Java Complete Reference | Issue Date: 03-JUN-2026
-- Issue ID: 5003 | Book ID: 102 | Title: Let Us Learn PL/SQL | Issue Date: 05-JUN-2026
-- Issue ID: 5004 | Book ID: 107 | Title: Data Structures in C | Issue Date: 10-JUN-2026
-- Issue ID: 5005 | Book ID: 111 | Title: Advanced DBMS | Issue Date: 11-JUN-2026
-- Issue ID: 5006 | Book ID: 103 | Title: Operating System Design | Issue Date: 15-JUN-2026
-- Issue ID: 5007 | Book ID: 108 | Title: Oracle SQL Handbook | Issue Date: 18-JUN-2026