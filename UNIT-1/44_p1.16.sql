DECLARE
    -- Anti-Plagiarism Seed Variables
    v_student_name VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    
    -- Anti-Plagiarism Seed: department_id = ((roll_no + 2) MOD 11 + 1) * 10
    v_dept_id       departments.department_id%TYPE := ((44 + 2) MOD 11 + 1) * 10; -- Evaluates to 30

    -- Anchored Declarations using %TYPE
    v_dname         departments.department_name%TYPE;
    v_loc           departments.location_id%TYPE;
BEGIN
    -- Query department details into anchored variables
    SELECT department_name, location_id
    INTO v_dname, v_loc
    FROM departments
    WHERE department_id = v_dept_id;

    -- Formatted Output
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          DEPARTMENT LOOKUP              ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Roll Number  : ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Dept [' || v_dept_id || ']: ' || v_dname || ' at location ' || v_loc);
    DBMS_OUTPUT.PUT_LINE('=========================================');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Error: No department found with ID ' || v_dept_id);
        DBMS_OUTPUT.PUT_LINE('=========================================');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

''' output 
=========================================
          DEPARTMENT LOOKUP              
=========================================
Student Name : Lo Ronak
Roll Number  : 44
-----------------------------------------
Dept [30]: Purchasing at location 1700
========================================='''