DECLARE
    -- Personalization & Seed Variables
    v_student_name VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    
    -- Anti-Plagiarism Seed: employee_id = 100 + (roll_no MOD 20)
    v_emp_id        NUMBER       := 100 + MOD(v_roll_no, 20); -- Evaluates to 104
    
    -- Rowtype Variable
    v_emp           employees%ROWTYPE;
    
    -- Salary Components
    v_basic_pay     NUMBER;
    v_da            NUMBER;
    v_hra           NUMBER;
    v_gross_pay     NUMBER;
    v_pf            NUMBER;
    v_net_pay       NUMBER;
BEGIN
    -- Fetch full employee row into %ROWTYPE
    SELECT * 
    INTO v_emp 
    FROM employees 
    WHERE employee_id = v_emp_id;

    -- Earnings & Deductions Calculations
    v_basic_pay := v_emp.salary;
    v_da        := v_basic_pay * 0.40; -- 40% DA
    v_hra       := v_basic_pay * 0.20; -- 20% HRA
    v_gross_pay := v_basic_pay + v_da + v_hra;
    v_pf        := v_basic_pay * 0.12; -- 12% PF Deduction
    v_net_pay   := v_gross_pay - v_pf;

    -- Print Formatted Salary Slip
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('LJ CORPORATION PVT LTD', 50, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('SALARY SLIP FOR ' || UPPER(TO_CHAR(SYSDATE, 'Month YYYY')), 50, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Student Name : ' || v_student_name || ' (Roll: ' || v_roll_no || ')', 50, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Employee ID  : ' || v_emp.employee_id, 50, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Employee Name: ' || v_emp.first_name || ' ' || v_emp.last_name, 50, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Job Title ID : ' || v_emp.job_id, 50, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Department ID: ' || v_emp.department_id, 50, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('EARNINGS', 30, ' ') || RPAD('AMOUNT (Rs.)', 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Basic Salary', 30, ' ') || LPAD(TO_CHAR(v_basic_pay, '99,99,999.00'), 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Dearness Allowance (DA 40%)', 30, ' ') || LPAD(TO_CHAR(v_da, '99,99,999.00'), 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('House Rent Allowance (HRA 20%)', 30, ' ') || LPAD(TO_CHAR(v_hra, '99,99,999.00'), 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('GROSS EARNINGS', 30, ' ') || LPAD(TO_CHAR(v_gross_pay, '99,99,999.00'), 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('DEDUCTIONS', 30, ' ') || RPAD('AMOUNT (Rs.)', 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('Provident Fund (PF 12%)', 30, ' ') || LPAD(TO_CHAR(v_pf, '99,99,999.00'), 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('NET PAYABLE', 30, ' ') || LPAD(TO_CHAR(v_net_pay, '99,99,999.00'), 20, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 52, '-') || '+');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee with ID ' || v_emp_id || ' not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

'''output
+----------------------------------------------------+
| LJ CORPORATION PVT LTD                             |
| SALARY SLIP FOR AUGUST    2026                     |
+----------------------------------------------------+
| Student Name : Lo Ronak (Roll: 44)                 |
| Employee ID  : 104                                 |
| Employee Name: Bruce Ernst                         |
| Job Title ID : IT_PROG                             |
| Department ID: 60                                  |
+----------------------------------------------------+
| EARNINGS                      AMOUNT (Rs.)         |
+----------------------------------------------------+
| Basic Salary                              6,000.00 |
| Dearness Allowance (DA 40%)               2,400.00 |
| House Rent Allowance (HRA 20%)            1,200.00 |
+----------------------------------------------------+
| GROSS EARNINGS                            9,600.00 |
+----------------------------------------------------+
| DEDUCTIONS                    AMOUNT (Rs.)         |
+----------------------------------------------------+
| Provident Fund (PF 12%)                     720.00 |
+----------------------------------------------------+
| NET PAYABLE                               8,880.00 |
+----------------------------------------------------+ '''