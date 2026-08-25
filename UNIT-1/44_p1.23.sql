DECLARE
    -- Bug Fix #2: Increased VARCHAR2 size from 5 to 50 to prevent VALUE_ERROR 
    -- (since 'Lo Ronak' has 8 characters and exceeds length 5).
    v_name  VARCHAR2(50) := 'Lo Ronak';
    
    -- Bug Fix #3: CONSTANT variables must be assigned a value upon declaration 
    -- and cannot be reassigned later in the executable section.
    c_bonus_rate CONSTANT NUMBER := 0.10;
    
    -- Bug Fix #4: Added missing semicolon (;) after the variable declaration.
    v_sal   NUMBER := (44 * 1000) + 20000; -- Evaluates to 64000
    
    -- Additional variables to capture query and calculated bonus results
    v_fname VARCHAR2(30);
    v_bonus NUMBER;
BEGIN
    -- Bug Fix #1: Use assignment operator (:=) instead of equality comparison (=) 
    -- if assigning values in procedural statements (or compute directly from rate).
    v_bonus := v_sal * c_bonus_rate;

    -- Bug Fix #5: A SELECT statement inside a PL/SQL anonymous block MUST use 
    -- an INTO clause to store fetched column values into a local variable.
    SELECT first_name 
    INTO v_fname 
    FROM employees 
    WHERE employee_id = 100;

    -- Output Results
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          DEBUG CHALLENGE FIXED          ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Employee Name   : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Fetched Mgr Name: ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('Base Salary     : Rs.' || LTRIM(TO_CHAR(v_sal, '99,99,999')));
    DBMS_OUTPUT.PUT_LINE('Bonus (10%)     : Rs.' || LTRIM(TO_CHAR(v_bonus, '99,99,999')));
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/



