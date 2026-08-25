DECLARE
    -- Anti-Plagiarism Seed Variables
    v_student_name VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    
    -- Principal calculation: roll_no * 10000 + 50000
    v_p             NUMBER       := (v_roll_no * 10000) + 50000; -- Evaluates to 4,90,000
    v_annual_rate   NUMBER       := 9; -- 9% per annum
    v_years         NUMBER       := 5; -- 5 years tenure
    
    -- Intermediate EMI Calculation Variables
    v_r             NUMBER; -- Monthly interest rate
    v_n             NUMBER; -- Total tenure in months
    v_power_term    NUMBER;
    
    -- Result Variables
    v_emi           NUMBER;
    v_total_payment NUMBER;
    v_total_interest NUMBER;
    v_interest_pct  NUMBER;
BEGIN
    -- 1. Calculate Monthly Rate (r) and Total Months (n)
    v_r := v_annual_rate / 12 / 100; -- 9 / 12 / 100 = 0.0075
    v_n := v_years * 12;            -- 5 * 12 = 60 months

    -- 2. Compute POWER(1+r, n)
    v_power_term := POWER(1 + v_r, v_n);

    -- 3. EMI Formula: P * r * (1+r)^n / ((1+r)^n - 1)
    v_emi := ROUND(v_p * v_r * v_power_term / (v_power_term - 1), 2);

    -- 4. Total Payment and Total Interest
    v_total_payment  := ROUND(v_emi * v_n, 2);
    v_total_interest := ROUND(v_total_payment - v_p, 2);

    -- 5. Bonus: Interest Percentage relative to Total Payment
    v_interest_pct   := ROUND((v_total_interest / v_total_payment) * 100, 2);

    -- Print EMI Calculation Breakdown
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('       SBI HOME LOAN EMI CALCULATOR      ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name   : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Roll Number    : ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Loan Principal : Rs.' || LTRIM(TO_CHAR(v_p, '99,99,999.00')));
    DBMS_OUTPUT.PUT_LINE('Annual Rate    : ' || v_annual_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Tenure (Years) : ' || v_years || ' Years (' || v_n || ' Months)');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Monthly EMI    : Rs.' || LTRIM(TO_CHAR(v_emi, '99,99,999.00')));
    DBMS_OUTPUT.PUT_LINE('Total Payment  : Rs.' || LTRIM(TO_CHAR(v_total_payment, '99,99,999.00')));
    DBMS_OUTPUT.PUT_LINE('Total Interest : Rs.' || LTRIM(TO_CHAR(v_total_interest, '99,99,999.00')));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Interest Share : ' || v_interest_pct || '% of total payment is interest');
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

''' output

=========================================
       SBI HOME LOAN EMI CALCULATOR      
=========================================
Student Name   : Lo Ronak
Roll Number    : 44
-----------------------------------------
Loan Principal : Rs.4,90,000.00
Annual Rate    : 9%
Tenure (Years) : 5 Years (60 Months)
-----------------------------------------
Monthly EMI    : Rs.10,171.60
Total Payment  : Rs.6,10,296.00
Total Interest : Rs.1,20,296.00
-----------------------------------------
Interest Share : 19.71% of total payment is interest
========================================='''
