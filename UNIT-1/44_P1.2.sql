SET SERVEROUTPUT ON;

DECLARE
   v_name       VARCHAR2(50) := 'Lo Ronak';
   v_marks      NUMBER(5,2)  := 420.00; -- Replace with your total marks out of 500
   v_percentage NUMBER(5,2);
   v_dob        DATE         := TO_DATE('2004-05-15', 'YYYY-MM-DD'); -- Replace with your DOB
   v_passed     BOOLEAN;
BEGIN
   -- Calculate percentage rounded to 2 decimal places
   v_percentage := ROUND((v_marks / 500) * 100, 2);
   
   -- Determine pass/fail status (passing criteria: 40%)
   IF v_percentage >= 40 THEN
      v_passed := TRUE;
   ELSE
      v_passed := FALSE;
   END IF;

   -- Output student details
   DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
   DBMS_OUTPUT.PUT_LINE('DOB: ' || TO_CHAR(v_dob, 'DD-Mon-YYYY'));
   DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks || '/500');
   DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
   DBMS_OUTPUT.PUT_LINE('Today''s Date: ' || TO_CHAR(SYSDATE, 'DD-Mon-YYYY HH24:MI:SS'));
   
   -- Print PASS/FAIL based on v_passed
   IF v_passed THEN
      DBMS_OUTPUT.PUT_LINE('Result: PASS');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Result: FAIL');
   END IF;
END;
/

'''output

Name: Lo Ronak
DOB: 15-May-2004
Marks: 420/500
Percentage: 84%
Todays Date: 24-Aug-2026 19:05:37
Result: PASS '''