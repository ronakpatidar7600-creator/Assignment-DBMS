SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'ronak';
    v_roll NUMBER := 44;

    v_attendance NUMBER := 85;
    v_theory NUMBER := 55;
    v_practical NUMBER := 24;
    v_assignment NUMBER := 9;

    v_assignment_counted NUMBER;
    v_total NUMBER;
    v_percentage NUMBER;
    v_grade VARCHAR2(10);
    v_result VARCHAR2(30);
    v_remark VARCHAR2(100);
BEGIN

    -- Only maximum 10 assignment marks are counted
    v_assignment_counted := LEAST(v_assignment, 10);

    -- =========================================
    -- Attendance check
    -- =========================================

    IF v_attendance < 40 THEN

        v_result := 'DETAINED';
        v_grade := 'N/A';
        v_remark := 'Insufficient attendance';

    -- =========================================
    -- Theory marks check
    -- =========================================

    ELSIF v_theory < 28 THEN

        v_result := 'FAIL in Theory';
        v_grade := 'FAIL';
        v_remark := 'Theory marks below passing criteria';

    -- =========================================
    -- Practical marks check
    -- =========================================

    ELSIF v_practical < 12 THEN

        v_result := 'FAIL in Practical';
        v_grade := 'FAIL';
        v_remark := 'Practical marks below passing criteria';

    ELSE

        -- Calculate total
        v_total := v_theory + v_practical + v_assignment_counted;

        -- Total is out of 110
        v_percentage := v_total / 110 * 100;

        -- Grade using CASE
        v_grade := CASE
            WHEN v_percentage >= 75 THEN 'A+'
            WHEN v_percentage >= 60 THEN 'A'
            WHEN v_percentage >= 50 THEN 'B'
            WHEN v_percentage >= 40 THEN 'C'
            WHEN v_percentage >= 35 THEN 'D'
            ELSE 'FAIL'
        END;

        v_result := 'PASS';

        -- One-line marksheet remark
        IF v_percentage >= 75 THEN
            v_remark := 'Excellent performance';
        ELSIF v_percentage >= 60 THEN
            v_remark := 'Very good performance';
        ELSIF v_percentage >= 50 THEN
            v_remark := 'Good performance';
        ELSE
            v_remark := 'Needs improvement';
        END IF;

    END IF;

    -- =========================================
    -- Print result
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== LJICA SEMESTER RESULT =====');
    DBMS_OUTPUT.PUT_LINE('Name              : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No           : ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('Attendance        : ' || v_attendance || '%');
    DBMS_OUTPUT.PUT_LINE('Theory Marks      : ' || v_theory || '/70');
    DBMS_OUTPUT.PUT_LINE('Practical Marks   : ' || v_practical || '/30');
    DBMS_OUTPUT.PUT_LINE('Assignment Marks  : ' || v_assignment_counted || '/10');

    IF v_total IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Total             : ' || v_total || '/110');
        DBMS_OUTPUT.PUT_LINE(
            'Percentage        : ' || ROUND(v_percentage, 2) || '%'
        );
    END IF;

    DBMS_OUTPUT.PUT_LINE('Grade             : ' || v_grade);
    DBMS_OUTPUT.PUT_LINE('Result            : ' || v_result);
    DBMS_OUTPUT.PUT_LINE('Remark            : ' || v_remark);

END;
/

-- OUTPUT:
-- ===== LJICA SEMESTER RESULT =====
-- Name              : Mishri Amrutiya
-- Roll No           : 52
-- Attendance        : 85%
-- Theory Marks      : 55/70
-- Practical Marks   : 24/30
-- Assignment Marks  : 9/10
-- Total             : 88/110
-- Percentage        : 80%
-- Grade             : A+
-- Result            : PASS
-- Remark            : Excellent performance