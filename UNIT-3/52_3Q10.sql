SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_overdue (
        p_days NUMBER
    ) IS
        SELECT issue_id,
               book_id,
               issue_date,
               TRUNC(SYSDATE) - TRUNC(issue_date) AS overdue_days
        FROM book_issue
        WHERE return_date IS NULL
          AND TRUNC(SYSDATE) - TRUNC(issue_date) > p_days;

    v_fine  NUMBER(10,2);
    v_total NUMBER(10,2) := 0;

BEGIN
    FOR r_issue IN c_overdue(&days)
    LOOP
        v_fine := r_issue.overdue_days * 2;
        v_total := v_total + v_fine;

        DBMS_OUTPUT.PUT_LINE(
            'Issue ID: ' || r_issue.issue_id ||
            ' | Book ID: ' || r_issue.book_id ||
            ' | Issue Date: ' ||
            TO_CHAR(r_issue.issue_date, 'DD-MON-YYYY') ||
            ' | Overdue Days: ' || r_issue.overdue_days ||
            ' | Fine: Rs.' || v_fine
        );
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Total Fine Payable: Rs.' || v_total
    );
END;
/

-- TEST:
-- Enter value for days: 30

-- OUTPUT (if SYSDATE is 25-AUG-2026):
-- Issue ID: 5002 | Book ID: 104 | Issue Date: 03-JUN-2026 | Overdue Days: 83 | Fine: Rs.166
-- Issue ID: 5004 | Book ID: 107 | Issue Date: 10-JUN-2026 | Overdue Days: 76 | Fine: Rs.152
-- Issue ID: 5006 | Book ID: 103 | Issue Date: 15-JUN-2026 | Overdue Days: 71 | Fine: Rs.142
-- Issue ID: 5008 | Book ID: 106 | Issue Date: 01-JUL-2026 | Overdue Days: 55 | Fine: Rs.110
-- Issue ID: 5010 | Book ID: 112 | Issue Date: 09-JUL-2026 | Overdue Days: 47 | Fine: Rs.94
-- Issue ID: 5012 | Book ID: 109 | Issue Date: 20-JUL-2026 | Overdue Days: 36 | Fine: Rs.72
-- Total Fine Payable: Rs.736