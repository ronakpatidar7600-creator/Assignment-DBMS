DECLARE
    -- Anti-Plagiarism Seed Variables (Name typed messily)
    v_student_name  VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    v_raw_name      VARCHAR2(100) := '   lo    RONAK   '; -- Extra leading, trailing, & middle spaces + wrong case
    
    -- Cleaning & Processing Variables
    v_temp_name     VARCHAR2(100);
    v_clean_name    VARCHAR2(100);
    v_first_name    VARCHAR2(50);
    v_last_name     VARCHAR2(50);
    v_email         VARCHAR2(100);
    v_space_pos     NUMBER;
BEGIN
    -- Step 1: TRIM leading and trailing spaces
    v_temp_name := TRIM(v_raw_name);

    -- Step 2: Collapse multiple internal spaces
    -- Applying REPLACE(..., '  ', ' ') twice handles clusters of 3+ consecutive spaces.
    v_temp_name := REPLACE(v_temp_name, '  ', ' ');
    v_temp_name := REPLACE(v_temp_name, '  ', ' ');

    -- Step 3: Apply INITCAP to standardize capitalization
    v_clean_name := INITCAP(v_temp_name);

    -- Step 4: Extract First Name and Last Name using INSTR & SUBSTR
    v_space_pos := INSTR(v_clean_name, ' ');
    IF v_space_pos > 0 THEN
        v_first_name := SUBSTR(v_clean_name, 1, v_space_pos - 1);
        v_last_name  := SUBSTR(v_clean_name, v_space_pos + 1);
    ELSE
        v_first_name := v_clean_name;
        v_last_name  := '';
    END IF;

    -- Step 5: Generate College Email Address
    v_email := LOWER(v_first_name || '.' || v_last_name || '@ljku.edu.in');

    -- Print Formatted Output
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          MESSY NAME CLEANER             ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name   : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Roll Number    : ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Raw Input      : "' || v_raw_name || '"');
    DBMS_OUTPUT.PUT_LINE('Raw Length     : ' || LENGTH(v_raw_name) || ' characters');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Cleaned Name   : "' || v_clean_name || '"');
    DBMS_OUTPUT.PUT_LINE('Clean Length   : ' || LENGTH(v_clean_name) || ' characters');
    DBMS_OUTPUT.PUT_LINE('First Name     : ' || v_first_name);
    DBMS_OUTPUT.PUT_LINE('Last Name      : ' || v_last_name);
    DBMS_OUTPUT.PUT_LINE('College Email  : ' || v_email);
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

''' output
=========================================
          MESSY NAME CLEANER             
=========================================
Student Name   : Lo Ronak
Roll Number    : 44
-----------------------------------------
Raw Input      : "   lo    RONAK   "
Raw Length     : 17 characters
-----------------------------------------
Cleaned Name   : "Lo Ronak"
Clean Length   : 8 characters
First Name     : Lo
Last Name      : Ronak
College Email  : lo.ronak@ljku.edu.in
========================================='''