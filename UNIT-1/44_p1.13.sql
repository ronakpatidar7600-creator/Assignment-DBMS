DECLARE
    -- Anti-Plagiarism Seed Variables
    v_roll_no   NUMBER := 44;
    
    -- Seed Calculation: amount = roll_no * 137 + 1000
    v_amount    NUMBER := (v_roll_no * 137) + 1000; -- Evaluates to 7028
    
    -- Processing Variables
    v_temp_amt  NUMBER;
    v_n500      NUMBER;
    v_n200      NUMBER;
    v_n100      NUMBER;
    v_undisp    NUMBER;
BEGIN
    -- Initialize working variable with total amount
    v_temp_amt := v_amount;

    -- Calculate Rs.500 notes and remaining amount
    v_n500     := TRUNC(v_temp_amt / 500);
    v_temp_amt := MOD(v_temp_amt, 500);

    -- Calculate Rs.200 notes and remaining amount
    v_n200     := TRUNC(v_temp_amt / 200);
    v_temp_amt := MOD(v_temp_amt, 200);

    -- Calculate Rs.100 notes and remaining amount
    v_n100     := TRUNC(v_temp_amt / 100);
    v_undisp   := MOD(v_temp_amt, 100);

    -- Print ATM Note Splitter Receipt
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('           ATM CASH DISPENSER            ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name : Lo Ronak (Roll No: ' || v_roll_no || ')');
    DBMS_OUTPUT.PUT_LINE('Requested    : Rs.' || LTRIM(TO_CHAR(v_amount, '99,99,999')));
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('DENOMINATION BREAKUP:');
    DBMS_OUTPUT.PUT_LINE('  Rs. 500 Notes : ' || LPAD(TO_CHAR(v_n500), 4, ' ') || '  (Rs.' || LTRIM(TO_CHAR(v_n500 * 500, '99,99,999')) || ')');
    DBMS_OUTPUT.PUT_LINE('  Rs. 200 Notes : ' || LPAD(TO_CHAR(v_n200), 4, ' ') || '  (Rs.' || LTRIM(TO_CHAR(v_n200 * 200, '99,99,999')) || ')');
    DBMS_OUTPUT.PUT_LINE('  Rs. 100 Notes : ' || LPAD(TO_CHAR(v_n100), 4, ' ') || '  (Rs.' || LTRIM(TO_CHAR(v_n100 * 100, '99,99,999')) || ')');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Dispensed: Rs.' || LTRIM(TO_CHAR((v_n500 * 500) + (v_n200 * 200) + (v_n100 * 100), '99,99,999')));
    DBMS_OUTPUT.PUT_LINE('Undispensed    : Rs.' || v_undisp);
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

''' output 
=========================================
           ATM CASH DISPENSER            
=========================================
Student Name : Lo Ronak (Roll No: 44)
Requested    : Rs.7,028
-----------------------------------------
DENOMINATION BREAKUP:
  Rs. 500 Notes :   14  (Rs.7,000)
  Rs. 200 Notes :    0  (Rs.0)
  Rs. 100 Notes :    0  (Rs.0)
-----------------------------------------
Total Dispensed: Rs.7,000
Undispensed    : Rs.28
========================================= '''