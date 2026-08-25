DECLARE
    -- Anti-Plagiarism Seed: N = roll_no MOD 12 + 1
    v_roll_no   NUMBER := 44;
    v_months    NUMBER := MOD(44, 12) + 1; -- Evaluates to 9
    
    -- Processing Variables
    v_today     DATE := SYSDATE;
    v_future    DATE;
    v_last_day  DATE;
    v_next_mon  DATE;
    v_days_left NUMBER;
BEGIN
    -- 1. Date Calculations
    v_future    := ADD_MONTHS(v_today, v_months);
    v_last_day  := LAST_DAY(v_today);
    v_next_mon  := NEXT_DAY(v_today, 'MONDAY');
    v_days_left := TRUNC(v_last_day - v_today);

    -- 2. Print Output
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('         DATE FUNCTION PLAYGROUND        ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name : Lo Ronak (Roll No: ' || v_roll_no || ')');
    DBMS_OUTPUT.PUT_LINE('Months Seed  : ' || v_months || ' Month(s)');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('1. Today''s Date      : ' || TO_CHAR(v_today, 'Day, DD "th" Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('2. After ' || LPAD(v_months, 2, ' ') || ' Months  : ' || TO_CHAR(v_future, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('3. Last Day of Month : ' || TO_CHAR(v_last_day, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('4. Next Monday Date  : ' || TO_CHAR(v_next_mon, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('5. Days Left in Month: ' || v_days_left || ' days');
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

''' output 
=========================================
         DATE FUNCTION PLAYGROUND        
=========================================
Student Name : Lo Ronak (Roll No: 44)
Months Seed  : 9 Month(s)
-----------------------------------------
1. Today's Date      : Monday   , 24 th August    2026
2. After  9 Months  : 24-MAY-2027
3. Last Day of Month : 31-AUG-2026
4. Next Monday Date  : 31-AUG-2026
5. Days Left in Month: 7 days
========================================= '''