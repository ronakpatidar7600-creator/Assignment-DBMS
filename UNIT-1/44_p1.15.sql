DECLARE
    -- Anti-Plagiarism Seed Variables
    v_student_name VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    
    -- Anti-Plagiarism Seed: department_id = (roll_no MOD 6 + 1) * 10
    v_dept_id       NUMBER       := (MOD(v_roll_no, 6) + 1) * 10; -- Evaluates to 30
    
    -- Aggregate Variables
    v_emp_count     NUMBER;
    v_avg_salary    NUMBER;
    v_max_salary    NUMBER;
    v_dept_name     departments.department_name%TYPE;
BEGIN
    -- Fetch Department Name for display
    SELECT department_name 
    INTO v_dept_name 
    FROM departments 
    WHERE department_id = v_dept_id;

    -- Fetch aggregate department statistics in a single SELECT INTO query
    SELECT COUNT(*), 
           ROUND(AVG(salary), 2), 
           MAX(salary)
    INTO v_emp_count, 
         v_avg_salary, 
         v_max_salary
    FROM employees
    WHERE department_id = v_dept_id;

    -- Print Department Summary
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          DEPARTMENT STATISTICS          ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name   : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Roll Number    : ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('Department ID  : ' || v_dept_id);
    DBMS_OUTPUT.PUT_LINE('Department Name: ' || v_dept_name);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || v_emp_count);
    DBMS_OUTPUT.PUT_LINE('Average Salary : Rs.' || NVL(TO_CHAR(v_avg_salary, '99,999.99'), '0.00'));
    DBMS_OUTPUT.PUT_LINE('Maximum Salary : Rs.' || NVL(TO_CHAR(v_max_salary, '99,999.99'), '0.00'));
    DBMS_OUTPUT.PUT_LINE('=========================================');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Department ID ' || v_dept_id || ' does not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/


'''output
=========================================
          DEPARTMENT STATISTICS          
=========================================
Student Name   : Lo Ronak
Roll Number    : 44
Department ID  : 30
Department Name: Purchasing
-----------------------------------------
Total Employees: 6
Average Salary : Rs.  4,150.00
Maximum Salary : Rs. 11,000.00
========================================= '''
