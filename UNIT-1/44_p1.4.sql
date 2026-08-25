SET SERVEROUTPUT ON;

-- =============================================================
-- TEST 1: Valid Employee ID (100 + MOD(44, 7) = 100 + 2 = 102)
-- =============================================================
DECLARE
   v_roll_no  NUMBER := 44;
   v_emp_id   NUMBER := 100 + MOD(v_roll_no, 7); -- 102
   v_fname    employees.first_name%TYPE;
   v_sal      employees.salary%TYPE;
BEGIN
   SELECT first_name, salary
   INTO v_fname, v_sal
   FROM employees
   WHERE employee_id = v_emp_id;

   DBMS_OUTPUT.PUT_LINE('--- TEST 1 (Valid ID: ' || v_emp_id || ') ---');
   DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname || ' earns Rs.' || v_sal || ' per month.');
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('--- TEST 1 (Valid ID: ' || v_emp_id || ') ---');
      DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
END;
/

-- =============================================================
-- TEST 2: Non-existent Employee ID (roll_no = 44)
-- =============================================================
DECLARE
   v_roll_no  NUMBER := 44;
   v_emp_id   NUMBER := v_roll_no; -- 44 (Not present in standard HR schema)
   v_fname    employees.first_name%TYPE;
   v_sal      employees.salary%TYPE;
BEGIN
   SELECT first_name, salary
   INTO v_fname, v_sal
   FROM employees
   WHERE employee_id = v_emp_id;

   DBMS_OUTPUT.PUT_LINE('--- TEST 2 (Non-existent ID: ' || v_emp_id || ') ---');
   DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname || ' earns Rs.' || v_sal || ' per month.');
EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('--- TEST 2 (Non-existent ID: ' || v_emp_id || ') ---');
      DBMS_OUTPUT.PUT_LINE('Employee not found — check the ID.');
END;
/

'''output 

--- TEST 1 (Valid ID: 102) ---
Employee: Lex earns Rs.17000 per month.

--- TEST 2 (Non-existent ID: 44) ---
Employee not found — check the ID. '''