DECLARE
    -- Anti-Plagiarism Seed Variables
    v_student_name VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    
    -- Plan Selection Index: roll_no MOD 4 + 1
    v_plan_idx      NUMBER       := MOD(v_roll_no, 4) + 1; -- Evaluates to 1
    v_plan_price    NUMBER;
    v_plan_name     VARCHAR2(30);
    
    -- Constants
    c_gst CONSTANT  NUMBER       := 18; -- 18% GST Rate
    
    -- Calculation Variables
    v_gst_amt       NUMBER;
    v_total_amt     NUMBER;
    v_validity_date DATE;
BEGIN
    -- Select Plan Price based on index (1 => 199, 2 => 299, 3 => 399, 4 => 599)
    IF v_plan_idx = 1 THEN
        v_plan_price := 199;
        v_plan_name  := '28 Days Unlimited Pack';
    ELSIF v_plan_idx = 2 THEN
        v_plan_price := 299;
        v_plan_name  := '28 Days High-Speed Pack';
    ELSIF v_plan_idx = 3 THEN
        v_plan_price := 399;
        v_plan_name  := '56 Days Unlimited Pack';
    ELSE
        v_plan_price := 599;
        v_plan_name  := '84 Days Super Saver Pack';
    END IF;

    -- Financial Calculations
    v_gst_amt       := v_plan_price * (c_gst / 100);
    v_total_amt     := v_plan_price + v_gst_amt;
    v_validity_date := SYSDATE + 28;

    -- Print Formatted Receipt using RPAD
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          JIO MOBILE RECHARGE            ');
    DBMS_OUTPUT.PUT_LINE('            TAX INVOICE                  ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('Customer Name', 20) || ': ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('Roll Number', 20)   || ': ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE(RPAD('Plan Selected', 20)  || ': ' || v_plan_name);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Plan Price', 20) || ': Rs.' || TO_CHAR(v_plan_price, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('GST @ 18%', 20)       || ': Rs.' || TO_CHAR(v_gst_amt, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Total Payable', 20)   || ': Rs.' || TO_CHAR(v_total_amt, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE(RPAD('Recharge Date', 20)   || ': ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Validity Date', 20)   || ': ' || TO_CHAR(v_validity_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/


''' output 
=========================================
          JIO MOBILE RECHARGE            
            TAX INVOICE                  
=========================================
Customer Name       : Lo Ronak
Roll Number         : 44
Plan Selected       : 28 Days Unlimited Pack
-----------------------------------------
Base Plan Price     : Rs.    199.00
GST @ 18%           : Rs.     35.82
-----------------------------------------
Total Payable       : Rs.    234.82
-----------------------------------------
Recharge Date       : 24-AUG-2026
Validity Date       : 21-SEP-2026
========================================= '''