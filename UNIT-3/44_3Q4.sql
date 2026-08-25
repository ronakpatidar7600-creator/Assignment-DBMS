SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_members (
        p_course VARCHAR2,
        p_semester NUMBER
    ) IS
        SELECT member_id, member_name, course, semester, join_date
        FROM lib_member
        WHERE UPPER(course) = UPPER(p_course)
        AND semester = p_semester;

BEGIN
    FOR r_member IN c_members('&course', &semester)
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Member ID: ' || r_member.member_id ||
            ' | Name: ' || r_member.member_name ||
            ' | Course: ' || r_member.course ||
            ' | Semester: ' || r_member.semester ||
            ' | Join Date: ' ||
            TO_CHAR(r_member.join_date, 'DD-MON-YYYY')
        );
    END LOOP;
END;
/

-- TEST:
-- Enter value for course: MSc IT
-- Enter value for semester: 3

-- OUTPUT:
-- Member ID: 2 | Name: Arjun Mehta | Course: MSc IT | Semester: 3 | Join Date: 22-JUL-2025
-- Member ID: 6 | Name: Vivek Nair | Course: MSc IT | Semester: 3 | Join Date: 11-DEC-2025