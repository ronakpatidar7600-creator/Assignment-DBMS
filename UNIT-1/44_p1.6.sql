DECLARE
    -- Anti-Plagiarism Seed Variables
    v_roll_no       NUMBER := 44;
    v_birth_month   NUMBER := 1; -- ** CHANGE THIS TO YOUR ACTUAL BIRTH MONTH (1-12) **
    
    -- Main Variables
    v_principal     NUMBER;
    v_rate          NUMBER;
    v_years         NUMBER := 3;
    
    -- Calculation Variables
    v_si            NUMBER;
    v_ci            NUMBER;
    v_final_si      NUMBER;
    v_final_ci      NUMBER;
    v_diff_pct      NUMBER;
BEGIN
    -- Calculate personalized seed values based on Roll No and Birth Month
    v_principal := v_roll_no * 1000;
    v_rate      := (v_birth_month * 0.5) + 4;
    
    -- (1) Simple Interest Calculation
    v_si := (v_principal * v_rate * v_years) / 100;
    
    -- (2) Compound Interest Calculation using POWER
    v_ci := v_principal * POWER(1 + (v_rate / 100), v_years) - v_principal;
    
    -- (3) Final Amounts
    v_final_si := v_principal + v_si;
    v_final_ci := v_principal + v_ci;
    
    -- Calculate percentage difference between CI and SI
    v_diff_pct := ((v_ci - v_si) / v_si) * 100;
    
    -- Print Formatted Results
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('       BANK INTEREST CALCULATOR          ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name: Lo Ronak (Roll No: ' || v_roll_no || ')');
    DBMS_OUTPUT.PUT_LINE('Principal   : Rs.' || LTRIM(TO_CHAR(v_principal, '99,999,999')));
    DBMS_OUTPUT.PUT_LINE('Rate        : ' || v_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Years       : ' || v_years);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Simple Interest (SI)   : Rs.' || LTRIM(TO_CHAR(v_si, '99,999,999.99')));
    DBMS_OUTPUT.PUT_LINE('Compound Interest (CI) : Rs.' || LTRIM(TO_CHAR(v_ci, '99,999,999.99')));
    DBMS_OUTPUT.PUT_LINE('Final Amount (with SI) : Rs.' || LTRIM(TO_CHAR(v_final_si, '99,999,999.99')));
    DBMS_OUTPUT.PUT_LINE('Final Amount (with CI) : Rs.' || LTRIM(TO_CHAR(v_final_ci, '99,999,999.99')));
    DBMS_OUTPUT.PUT_LINE('Difference (CI - SI)   : Rs.' || LTRIM(TO_CHAR(v_ci - v_si, '99,999,999.99')));
    
    -- Condition checking if CI is greater than SI by more than 10%
    IF v_diff_pct > 10 THEN
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
        DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.');
    END IF;
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/


''' output 
=========================================
       BANK INTEREST CALCULATOR          
=========================================
Student Name: Lo Ronak (Roll No: 44)
Principal   : Rs.44,000
Rate        : 4.5%
Years       : 3
-----------------------------------------
Simple Interest (SI)   : Rs.5,940.00
Compound Interest (CI) : Rs.6,211.31
Final Amount (with SI) : Rs.49,940.00
Final Amount (with CI) : Rs.50,211.31
Difference (CI - SI)   : Rs.271.31
=========================================  '''