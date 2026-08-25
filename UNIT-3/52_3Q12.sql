SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_members (
        p_letter VARCHAR2
    ) IS
        SELECT member_id,
               member_name,
               course,
               semester
        FROM lib_member
        WHERE UPPER(member_name) LIKE UPPER(p_letter) || '%'
        ORDER BY member_id;

BEGIN
    FOR r_member IN c_members('&letter')
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Member ID: ' || r_member.member_id ||
            ' | Name: ' || r_member.member_name ||
            ' | Course: ' || r_member.course ||
            ' | Semester: ' || r_member.semester
        );
    END LOOP;
END;
/

-- TEST:
-- Enter value for letter: a

-- OUTPUT:
-- Member ID: 2 | Name: Arjun Mehta | Course: MSc IT | Semester: 3
-- Member ID: 7 | Name: Ananya Rao | Course: BCA | Semester: 5