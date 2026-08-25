SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'roank';
    v_roll NUMBER := 44;

    v_sub1 NUMBER := 72;
    v_sub2 NUMBER := 68;
    v_sub3 NUMBER := 81;
    v_sub4 NUMBER := 75;
    v_sub5 NUMBER := 64;

    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(10);
    v_result VARCHAR2(20);
BEGIN
    -- Calculate total marks
    v_total := v_sub1 + v_sub2 + v_sub3 + v_sub4 + v_sub5;

    -- Calculate percentage
    v_percentage := v_total / 5;

    -- Grade calculation using IF-ELSIF
    IF v_percentage >= 90 THEN
        v_grade := 'A+';
    ELSIF v_percentage >= 80 THEN
        v_grade := 'A';
    ELSIF v_percentage >= 70 THEN
        v_grade := 'B';
    ELSIF v_percentage >= 60 THEN
        v_grade := 'C';
    ELSIF v_percentage >= 50 THEN
        v_grade := 'D';
    ELSE
        v_grade := 'FAIL';
    END IF;

    -- Check whether any subject has less than 35 marks
    IF v_sub1 < 35 OR v_sub2 < 35 OR v_sub3 < 35
       OR v_sub4 < 35 OR v_sub5 < 35 THEN

        v_result := 'DETAINED';

        DBMS_OUTPUT.PUT_LINE('Failed Subject(s):');

        IF v_sub1 < 35 THEN
            DBMS_OUTPUT.PUT_LINE('Subject 1');
        END IF;

        IF v_sub2 < 35 THEN
            DBMS_OUTPUT.PUT_LINE('Subject 2');
        END IF;

        IF v_sub3 < 35 THEN
            DBMS_OUTPUT.PUT_LINE('Subject 3');
        END IF;

        IF v_sub4 < 35 THEN
            DBMS_OUTPUT.PUT_LINE('Subject 4');
        END IF;

        IF v_sub5 < 35 THEN
            DBMS_OUTPUT.PUT_LINE('Subject 5');
        END IF;

    ELSE
        -- Nested IF for class rank
        IF v_percentage >= 75 THEN
            v_result := 'Distinction';
        ELSIF v_percentage >= 60 THEN
            v_result := 'First Class';
        ELSIF v_percentage >= 50 THEN
            v_result := 'Second Class';
        ELSE
            v_result := 'Pass';
        END IF;
    END IF;

    -- Print complete report card
    DBMS_OUTPUT.PUT_LINE('===== REPORT CARD =====');
    DBMS_OUTPUT.PUT_LINE('Name       : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No    : ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('Subject 1  : ' || v_sub1);
    DBMS_OUTPUT.PUT_LINE('Subject 2  : ' || v_sub2);
    DBMS_OUTPUT.PUT_LINE('Subject 3  : ' || v_sub3);
    DBMS_OUTPUT.PUT_LINE('Subject 4  : ' || v_sub4);
    DBMS_OUTPUT.PUT_LINE('Subject 5  : ' || v_sub5);
    DBMS_OUTPUT.PUT_LINE('Total      : ' || v_total || '/500');
    DBMS_OUTPUT.PUT_LINE('Percentage : ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Grade      : ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result     : ' || v_result);
END;
/

-- OUTPUT:
-- ===== REPORT CARD =====
-- Name       : Mishri Amrutiya
-- Roll No    : 52
-- Subject 1  : 72
-- Subject 2  : 68
-- Subject 3  : 81
-- Subject 4  : 75
-- Subject 5  : 64
-- Total      : 360/500
-- Percentage : 72%
-- Grade      : B
-- Result     : First Class