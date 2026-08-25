SET SERVEROUTPUT ON;

DECLARE
   -- Constants
   c_gst_rate CONSTANT NUMBER := 18;
   
   -- Input variables (Roll No: 44)
   v_roll_no    NUMBER := 44;
   
   -- Calculated pricing variables
   v_base_price NUMBER;
   v_cgst       NUMBER;
   v_sgst       NUMBER;
   v_total      NUMBER;
   
   -- NULL handling variables
   v_city       VARCHAR2(50) := NULL;
   v_nvl_city   VARCHAR2(50);
   v_nvl2_city  VARCHAR2(50);
BEGIN
   -- -------------------------------------------------------------
   -- PART A: GST Calculation (base_price = roll_no * 500 + 1000)
   -- -------------------------------------------------------------
   v_base_price := v_roll_no * 500 + 1000; -- 44 * 500 + 1000 = 23,000
   v_cgst       := v_base_price * 0.09;     -- 9% CGST
   v_sgst       := v_base_price * 0.09;     -- 9% SGST
   v_total      := v_base_price + v_cgst + v_sgst;

   DBMS_OUTPUT.PUT_LINE('--- PART A: GST BREAKDOWN ---');
   DBMS_OUTPUT.PUT_LINE('Base Price  : Rs. ' || v_base_price);
   DBMS_OUTPUT.PUT_LINE('CGST (9%)   : Rs. ' || v_cgst);
   DBMS_OUTPUT.PUT_LINE('SGST (9%)   : Rs. ' || v_sgst);
   DBMS_OUTPUT.PUT_LINE('Total Price : Rs. ' || v_total);
   DBMS_OUTPUT.PUT_LINE('');

   -- -------------------------------------------------------------
   -- PART B: NULL Handling with NVL and NVL2
   -- -------------------------------------------------------------
   -- NVL(expr1, expr2): Returns expr2 if expr1 is NULL
   v_nvl_city := NVL(v_city, 'Ahmedabad');

   -- NVL2(expr1, expr2, expr3): Returns expr2 if expr1 is NOT NULL, else returns expr3
   v_nvl2_city := NVL2(v_city, 'City Known: ' || v_city, 'City Unknown');

   DBMS_OUTPUT.PUT_LINE('--- PART B: NULL & NVL HANDLING ---');
   DBMS_OUTPUT.PUT_LINE('Original v_city Value : ' || NVL(v_city, 'NULL'));
   DBMS_OUTPUT.PUT_LINE('Using NVL Result      : ' || v_nvl_city);
   DBMS_OUTPUT.PUT_LINE('Using NVL2 Result     : ' || v_nvl2_city);
END;
/

''' output 
--- PART A: GST BREAKDOWN ---
Base Price  : Rs. 23000
CGST (9%)   : Rs. 2070
SGST (9%)   : Rs. 2070
Total Price : Rs. 27140

--- PART B: NULL & NVL HANDLING ---
Original v_city Value : NULL
Using NVL Result      : Ahmedabad
Using NVL2 Result     : City Unknown '''