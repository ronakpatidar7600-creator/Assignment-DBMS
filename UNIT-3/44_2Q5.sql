SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_members IS
        SELECT member_name, course, semester
        FROM lib_member;

    v_count NUMBER := 0;
BEGIN
    FOR r_member IN c_members
    LOOP
        v_count := v_count + 1;

        DBMS_OUTPUT.PUT_LINE(
            v_count || '. ' ||
            UPPER(r_member.member_name) ||
            ' (' || r_member.course ||
            ' - Sem ' || r_member.semester || ')'
        );
    END LOOP;
END;
/

-- OUTPUT:
-- 1. RIYA SHAH (MSc IT - Sem 1)
-- 2. ARJUN MEHTA (MSc IT - Sem 3)
-- 3. NEHA PATEL (MCA - Sem 2)
-- 4. KARAN JOSHI (MCA - Sem 4)
-- 5. SNEHA DESAI (BCA - Sem 2)
-- 6. VIVEK NAIR (MSc IT - Sem 3)
-- 7. ANANYA RAO (BCA - Sem 5)
-- 8. MANAV TRIVEDI (MCA - Sem 2)