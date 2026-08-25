
DECLARE
    -- Anti-Plagiarism Seed Variables
    v_roll_no   NUMBER := 44;
    v_base_mark NUMBER := MOD(44, 30) + 60; -- Evaluates to 74
    
    -- Subject Marks (5th subject is NULL due to absence)
    v_m1 NUMBER := v_base_mark;
    v_m2 NUMBER := v_base_mark;
    v_m3 NUMBER := v_base_mark;
    v_m4 NUMBER := v_base_mark;
    v_m5 NUMBER := NULL; 
    
    -- Calculation Variables
    v_total    NUMBER;
    v_pct      NUMBER;
    v_passed   BOOLEAN;
    v_res_text VARCHAR2(10);
BEGIN
    -- Calculate total using NVL to treat NULL (absent) as 0
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);
    
    -- Calculate Percentage (out of 500)
    v_pct := ROUND((v_total / 500) * 100, 2);
    
    -- Evaluate BOOLEAN Condition
    v_passed := (v_pct >= 40);

    -- NOTE ON ORACLE PL/SQL LIMITATION:
    -- DBMS_OUTPUT.PUT_LINE(v_passed); -- THIS CAUSES A COMPILATION ERROR!
    -- Reason: Oracle SQL and PL/SQL DBMS_OUTPUT package do not support printing
    -- the PL/SQL BOOLEAN data type directly. It must be converted to text first 
    -- using a CASE expression or IF-THEN-ELSE statement.

    -- Convert BOOLEAN to text for output
    v_res_text := CASE WHEN v_passed THEN 'PASS' ELSE 'FAIL' END;

    -- Print Result Card
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('           ACADEMIC RESULT CARD          ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name : Lo Ronak (Roll No: ' || v_roll_no || ')');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Subject 1    : ' || v_m1);
    DBMS_OUTPUT.PUT_LINE('Subject 2    : ' || v_m2);
    DBMS_OUTPUT.PUT_LINE('Subject 3    : ' || v_m3);
    DBMS_OUTPUT.PUT_LINE('Subject 4    : ' || v_m4);
    DBMS_OUTPUT.PUT_LINE('Subject 5    : ' || NVL(TO_CHAR(v_m5), 'ABSENT (0)'));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Marks  : ' || v_total || ' / 500');
    DBMS_OUTPUT.PUT_LINE('Percentage   : ' || v_pct || '%');
    DBMS_OUTPUT.PUT_LINE('Final Result : ' || v_res_text);
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

''' output 
=========================================
           ACADEMIC RESULT CARD          
=========================================
Student Name : Lo Ronak (Roll No: 44)
-----------------------------------------
Subject 1    : 74
Subject 2    : 74
Subject 3    : 74
Subject 4    : 74
Subject 5    : ABSENT (0)
-----------------------------------------
Total Marks  : 296 / 500
Percentage   : 59.2%
Final Result : PASS
========================================= '''