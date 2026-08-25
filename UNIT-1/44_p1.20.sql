DECLARE
    -- Anti-Plagiarism Seed Variables
    v_passenger_name VARCHAR2(50) := 'Lo Ronak';
    v_roll_no        NUMBER       := 44;
    v_dob            DATE         := TO_DATE('15-JAN-2003', 'DD-MON-YYYY'); 
    -- UNCOMMENT LINE BELOW TO TEST SENIOR CITIZEN 40% CONCESSION:
    -- v_dob         := TO_DATE('01-JAN-1960', 'DD-MON-YYYY');

    -- Processing Variables
    v_pnr           VARCHAR2(20);
    v_journey_date  DATE;
    v_base_fare     NUMBER;
    v_age           NUMBER;
    v_concession    NUMBER := 0;
    v_final_fare    NUMBER;
    v_passenger_cat VARCHAR2(30);
BEGIN
    -- 1. Generate PNR: 'GJ' + YYMM + LPAD(roll_no, 4, '0')
    v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') || LPAD(v_roll_no, 4, '0');

    -- 2. Calculate Journey Date: SYSDATE + (roll_no MOD 30 + 1)
    v_journey_date := SYSDATE + (MOD(v_roll_no, 30) + 1);

    -- 3. Calculate Base Fare: roll_no * 50 + 200
    v_base_fare := (v_roll_no * 50) + 200;

    -- 4. Calculate Age from DOB using MONTHS_BETWEEN
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    -- Concession Logic (40% discount for Senior Citizens 60+)
    IF v_age >= 60 THEN
        v_concession    := v_base_fare * 0.40;
        v_passenger_cat := 'SENIOR CITIZEN (60+)';
    ELSE
        v_concession    := 0;
        v_passenger_cat := 'GENERAL ADULT';
    END IF;

    v_final_fare := v_base_fare - v_concession;

    -- 5. Print Aligned Railway Ticket
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 50, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('INDIAN RAILWAYS PASSENGER TICKET', 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('IRCTC E-TICKETING SYSTEM', 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 50, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('PNR NO        : ' || v_pnr, 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('PASSENGER NAME: ' || UPPER(v_passenger_name), 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('ROLL NO       : ' || v_roll_no, 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('AGE           : ' || v_age || ' Years', 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('CATEGORY      : ' || v_passenger_cat, 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('BOOKING DATE  : ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY'), 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('JOURNEY DATE  : ' || TO_CHAR(v_journey_date, 'Day, DD-MON-YYYY'), 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 50, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('BASE FARE     : Rs.' || LTRIM(TO_CHAR(v_base_fare, '99,999.00')), 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('CONCESSION    : Rs.' || LTRIM(TO_CHAR(v_concession, '99,999.00')), 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('| ' || RPAD('TOTAL FARE    : Rs.' || LTRIM(TO_CHAR(v_final_fare, '99,999.00')), 48, ' ') || ' |');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 50, '-') || '+');
END;
/

''' output
+--------------------------------------------------+
| INDIAN RAILWAYS PASSENGER TICKET                 |
| IRCTC E-TICKETING SYSTEM                         |
+--------------------------------------------------+
| PNR NO        : GJ26080044                       |
| PASSENGER NAME: LO RONAK                         |
| ROLL NO       : 44                               |
| AGE           : 23 Years                         |
| CATEGORY      : GENERAL ADULT                    |
| BOOKING DATE  : 24-AUG-2026                      |
| JOURNEY DATE  : Tuesday  , 08-SEP-2026           |
+--------------------------------------------------+
| BASE FARE     : Rs.2,400.00                      |
| CONCESSION    : Rs.0.00                          |
| TOTAL FARE    : Rs.2,400.00                      |
+--------------------------------------------------+ '''