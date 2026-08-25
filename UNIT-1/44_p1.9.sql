DECLARE
    -- Anti-Plagiarism Seed & Personal Details
    v_consumer_name VARCHAR2(50) := 'Lo Ronak';
    v_roll_no        NUMBER       := 44;
    
    -- Anti-Plagiarism Seed: units = roll_no * 10 + 50
    v_units          NUMBER       := (v_roll_no * 10) + 50;
    
    -- Constants
    c_rate  CONSTANT NUMBER       := 5;  -- Rs. per unit
    c_fixed CONSTANT NUMBER       := 70; -- Fixed monthly charge
    
    -- Calculation Variables
    v_energy_charge  NUMBER;
    v_total          NUMBER;
BEGIN
    -- Calculations
    v_energy_charge := v_units * c_rate;
    v_total         := v_energy_charge + c_fixed;
    
    -- Print Torrent Power Mini Bill
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('          TORRENT POWER LIMITED          ');
    DBMS_OUTPUT.PUT_LINE('             ELECTRICITY BILL            ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Consumer Name : ' || v_consumer_name);
    DBMS_OUTPUT.PUT_LINE('Roll Number   : ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || v_units || ' kWh');
    DBMS_OUTPUT.PUT_LINE('Rate per Unit : Rs.' || c_rate);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Energy Charge : Rs.' || ROUND(v_energy_charge, 2));
    DBMS_OUTPUT.PUT_LINE('Fixed Charge  : Rs.' || c_fixed);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total Payable : Rs.' || ROUND(v_total, 2));
    DBMS_OUTPUT.PUT_LINE('=========================================');
END;
/

'''output
=========================================
          TORRENT POWER LIMITED          
             ELECTRICITY BILL            
=========================================
Consumer Name : Lo Ronak
Roll Number   : 44
Units Consumed: 490 kWh
Rate per Unit : Rs.5
-----------------------------------------
Energy Charge : Rs.2450
Fixed Charge  : Rs.70
-----------------------------------------
Total Payable : Rs.2520
========================================= '''