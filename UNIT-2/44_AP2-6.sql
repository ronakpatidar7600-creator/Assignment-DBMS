SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'roank';
    v_roll NUMBER := 44;

    v_food NUMBER := 450;
    v_distance NUMBER := 5;

    v_rain CHAR(1) := 'Y';
    v_late_night CHAR(1) := 'N';
    v_festival CHAR(1) := 'N';
    v_peak CHAR(1) := 'Y';
    v_first_order CHAR(1) := 'Y';

    v_base NUMBER;
    v_rain_charge NUMBER := 0;
    v_night_charge NUMBER := 0;
    v_festival_charge NUMBER := 0;
    v_peak_charge NUMBER := 0;

    v_delivery NUMBER;
    v_discount NUMBER := 0;
    v_final_delivery NUMBER;
    v_grand_total NUMBER;
BEGIN

    -- =========================================
    -- Calculate base delivery charge using CASE
    -- =========================================

    v_base := CASE
        WHEN v_distance < 3 THEN 0
        WHEN v_distance <= 8 THEN 29
        WHEN v_distance <= 15 THEN 49
        ELSE 79
    END;

    v_delivery := v_base;

    -- Rain surcharge = 20%
    v_rain_charge := CASE
        WHEN v_rain = 'Y' THEN v_base * 0.20
        ELSE 0
    END;

    -- Late night surcharge = 15%
    v_night_charge := CASE
        WHEN v_late_night = 'Y' THEN v_base * 0.15
        ELSE 0
    END;

    -- Festival surcharge = 10%
    v_festival_charge := CASE
        WHEN v_festival = 'Y' THEN v_base * 0.10
        ELSE 0
    END;

    -- Peak hour surcharge = 10%
    v_peak_charge := CASE
        WHEN v_peak = 'Y' THEN v_base * 0.10
        ELSE 0
    END;

    -- Add all surcharges
    v_delivery := v_delivery
                  + v_rain_charge
                  + v_night_charge
                  + v_festival_charge
                  + v_peak_charge;

    -- =========================================
    -- Discount using IF
    -- =========================================

    IF v_food > 499 THEN
        -- Orders above Rs.499 get free delivery
        v_discount := v_delivery;
        v_final_delivery := 0;

    ELSIF v_first_order = 'Y' THEN
        -- First order gets 50% discount
        v_discount := v_delivery * 0.50;
        v_final_delivery := v_delivery - v_discount;

    ELSE
        v_final_delivery := v_delivery;
    END IF;

    -- Calculate grand total
    v_final_delivery := ROUND(v_final_delivery);
    v_grand_total := v_food + v_final_delivery;

    -- =========================================
    -- Print receipt
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== ZOMATO DELIVERY RECEIPT =====');
    DBMS_OUTPUT.PUT_LINE('Name           : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No        : ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('Food Total     : Rs.' || v_food);
    DBMS_OUTPUT.PUT_LINE('Distance       : ' || v_distance || ' km');
    DBMS_OUTPUT.PUT_LINE('Base Charge    : Rs.' || ROUND(v_base));
    DBMS_OUTPUT.PUT_LINE('Rain Surcharge : Rs.' || ROUND(v_rain_charge));
    DBMS_OUTPUT.PUT_LINE('Night Charge   : Rs.' || ROUND(v_night_charge));
    DBMS_OUTPUT.PUT_LINE('Festival       : Rs.' || ROUND(v_festival_charge));
    DBMS_OUTPUT.PUT_LINE('Peak Charge    : Rs.' || ROUND(v_peak_charge));
    DBMS_OUTPUT.PUT_LINE('Discount       : Rs.' || ROUND(v_discount));
    DBMS_OUTPUT.PUT_LINE('Final Delivery : Rs.' || v_final_delivery);
    DBMS_OUTPUT.PUT_LINE('Grand Total    : Rs.' || v_grand_total);

END;
/

-- OUTPUT:
-- ===== ZOMATO DELIVERY RECEIPT =====
-- Name           : Mishri Amrutiya
-- Roll No        : 52
-- Food Total     : Rs.450
-- Distance       : 5 km
-- Base Charge    : Rs.29
-- Rain Surcharge : Rs.6
-- Night Charge   : Rs.0
-- Festival       : Rs.0
-- Peak Charge    : Rs.3
-- Discount       : Rs.19
-- Final Delivery : Rs.19
-- Grand Total    : Rs.469