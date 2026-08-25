DECLARE
    -- Anti-Plagiarism Seed Variables
    v_full_name     VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    v_dob           DATE         := TO_DATE('15-JAN-2003', 'DD-MON-YYYY'); -- Update your actual DOB here

    -- Processing Variables
    v_upper_name    VARCHAR2(50);
    v_first_name    VARCHAR2(30);
    v_last_name     VARCHAR2(30);
    v_card_name     VARCHAR2(50);
    v_student_id    VARCHAR2(20);
    v_age           NUMBER;
    v_space_pos     NUMBER;
BEGIN
    -- 1. Convert name to UPPERCASE
    v_upper_name := UPPER(TRIM(v_full_name));

    -- 2. Extract First Name & Last Name using INSTR and SUBSTR
    v_space_pos := INSTR(v_upper_name, ' ');
    IF v_space_pos > 0 THEN
        v_first_name := SUBSTR(v_upper_name, 1, v_space_pos - 1);
        v_last_name  := SUBSTR(v_upper_name, v_space_pos + 1);
    ELSE
        v_first_name := v_upper_name;
        v_last_name  := '';
    END IF;

    -- Bonus: Abbreviate last name to initial if full name length > 20
    IF LENGTH(v_upper_name) > 20 AND LENGTH(v_last_name) > 0 THEN
        v_card_name := v_first_name || ' ' || SUBSTR(v_last_name, 1, 1) || '.';
    ELSE
        v_card_name := v_upper_name;
    END IF;

    -- 3. Generate Student ID: "LJICA" + Birth Year + LPAD Roll No (3 digits)
    v_student_id := 'LJICA' || TO_CHAR(v_dob, 'YYYY') || LPAD(v_roll_no, 3, '0');

    -- 4. Calculate Age from DOB
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    -- 5. Print Formatted Card with LPAD and RPAD alignment
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 42, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('LJ INSTITUTE OF COMPUTER APPLICATIONS', 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('STUDENT IDENTITY CARD', 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 42, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('ID NO    : ' || v_student_id, 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('NAME     : ' || v_card_name, 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('FIRST    : ' || v_first_name, 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('ROLL NO  : ' || TO_CHAR(v_roll_no), 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('DOB      : ' || TO_CHAR(v_dob, 'DD-MON-YYYY'), 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('AGE      : ' || TO_CHAR(v_age) || ' Years', 40, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 42, '-') || '+');
END;
/

'''output
+------------------------------------------+
| LJ INSTITUTE OF COMPUTER APPLICATIONS    |
| STUDENT IDENTITY CARD                    |
+------------------------------------------+
| ID NO    : LJICA2003044                  |
| NAME     : LO RONAK                      |
| FIRST    : LO                            |
| ROLL NO  : 44                            |
| DOB      : 15-JAN-2003                   |
| AGE      : 23 Years                      |
+------------------------------------------+ '''