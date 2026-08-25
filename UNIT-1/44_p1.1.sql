SET SERVEROUTPUT ON;

DECLARE
   v_name       VARCHAR2(50)  := 'Lo Ronak';
   v_roll_no    NUMBER        := 44; 
   v_message    VARCHAR2(100) := 'Welcome to PL/SQL!';
   v_lucky_num  NUMBER;
BEGIN
   -- (a) Print name and roll number
   DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
   DBMS_OUTPUT.PUT_LINE('Roll Number: ' || v_roll_no);
   
   -- (b) Print assigned message
   DBMS_OUTPUT.PUT_LINE('Message: ' || v_message);
   
   -- (c) Calculate and print lucky number: MOD(44, 7) + 1 = 2 + 1
   v_lucky_num := MOD(v_roll_no, 7) + 1;
   DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky_num);
END;
/

'''
->output

Name: Lo Ronak
Roll Number: 44
Message: Welcome to PL/SQL!
Lucky Number: 3 '''