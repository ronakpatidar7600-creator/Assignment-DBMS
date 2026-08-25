DECLARE
    -- Anti-Plagiarism Seed: Celsius = roll_no MOD 20 + 25
    v_roll_no   NUMBER := 44;
    v_celsius   NUMBER := MOD(44, 20) + 25; -- Evaluates to 29
    
    -- Conversion Variables
    v_fahrenheit NUMBER;
    v_kelvin     NUMBER;
    
    -- Reverse Conversion Variables
    v_f_input   NUMBER := 98.6;
    v_c_reverse NUMBER;
    
    -- Operator Precedence Verification Variables
    v_expr1 NUMBER;
    v_expr2 NUMBER;
BEGIN
    -- 1. Celsius to Fahrenheit & Kelvin
    v_fahrenheit := ROUND((v_celsius * 9 / 5) + 32, 1);
    v_kelvin     := v_celsius + 273.15;
    
    -- 2. Reverse Conversion: Fahrenheit (98.6) to Celsius
    v_c_reverse := ROUND((v_f_input - 32) * 5 / 9, 2);
    
    -- 3. Expression Precedence Test
    v_expr1 := v_celsius * 9 / 5 + 32;
    v_expr2 := v_celsius * (9 / 5) + 32;

    -- Output Results
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          TEMPERATURE CONVERTER          ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name : Lo Ronak (Roll No: ' || v_roll_no || ')');
    DBMS_OUTPUT.PUT_LINE('Input Celsius: ' || v_celsius || '°C');
    DBMS_OUTPUT.PUT_LINE('Fahrenheit   : ' || v_fahrenheit || '°F');
    DBMS_OUTPUT.PUT_LINE('Kelvin       : ' || v_kelvin || ' K');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('REVERSE CONVERSION:');
    DBMS_OUTPUT.PUT_LINE('Input  : ' || v_f_input || '°F');
    DBMS_OUTPUT.PUT_LINE('Output : ' || v_c_reverse || '°C (Verified 37°C)');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PRECEDENCE COMPARISON:');
    DBMS_OUTPUT.PUT_LINE('C*9/5+32   = ' || v_expr1);
    DBMS_OUTPUT.PUT_LINE('C*(9/5)+32 = ' || v_expr2);
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/


'''output

=========================================
          TEMPERATURE CONVERTER          
=========================================
Student Name : Lo Ronak (Roll No: 44)
Input Celsius: 29°C
Fahrenheit   : 84.2°F
Kelvin       : 302.15 K
-----------------------------------------
REVERSE CONVERSION:
Input  : 98.6°F
Output : 37°C (Verified 37°C)
-----------------------------------------
PRECEDENCE COMPARISON:
C*9/5+32   = 84.2
C*(9/5)+32 = 84.2
========================================= '''
