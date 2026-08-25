DECLARE
    v_roll_no  INTEGER := 44; 
    v_emp_id   employees.employee_id%TYPE;
    v_emp      employees%ROWTYPE;
    v_years    NUMBER;
BEGIN
    -- Calculate target Employee ID (100 + (44 MOD 9) + 1 = 109)
    v_emp_id := 100 + MOD(v_roll_no, 9) + 1;

    -- Fetch full employee row into %ROWTYPE
    SELECT * 
    INTO v_emp 
    FROM employees 
    WHERE employee_id = v_emp_id;

    -- Calculate total completed years of experience
    v_years := TRUNC(MONTHS_BETWEEN(SYSDATE, v_emp.hire_date) / 12);

    -- Print Formatted Profile Card
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('           EMPLOYEE PROFILE CARD         ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name: Lo Ronak (Roll No: ' || v_roll_no || ')');
    DBMS_OUTPUT.PUT_LINE('Name        : ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID      : ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('Dept ID     : ' || v_emp.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary      : ' || TO_CHAR(v_emp.salary, 'L99,999', 'NLS_CURRENCY=''Rs.'''));
    DBMS_OUTPUT.PUT_LINE('Hire Date   : ' || TO_CHAR(v_emp.hire_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Experience  : ' || v_years || ' Years');

    IF v_years > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Status      : Senior Employee');
    END IF;
    DBMS_OUTPUT.PUT_LINE('=========================================');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No employee found with ID ' || v_emp_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
''' out put
=========================================
           EMPLOYEE PROFILE CARD         
=========================================
Student Name: Lo Ronak (Roll No: 44)
Name        : Daniel Faviet
Job ID      : FI_ACCOUNT
Dept ID     : 100
Salary      : Rs. 9,000
Hire Date   : 16-AUG-2002
Experience  : 24 Years
Status      : Senior Employee
========================================= '''