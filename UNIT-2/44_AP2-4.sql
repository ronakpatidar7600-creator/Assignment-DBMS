SET SERVEROUTPUT ON;

DECLARE
    v_table NUMBER := MOD(44, 9) + 2;     -- Table number = 9
    v_height NUMBER := 5 + MOD(52, 5);    -- Height = 7
    v_i NUMBER;
    v_j NUMBER;
BEGIN

    -- =========================================
    -- PART A: Multiplication table of 9
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART A: TABLE OF ' || v_table || ' =====');

    FOR v_i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(
            v_table || ' x ' || v_i || ' = ' || (v_table * v_i)
        );
    END LOOP;


    -- =========================================
    -- PART B: Tables of 2, 3, 4 and 5
    -- Nested FOR loops are used
    -- LPAD provides alignment
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART B: TABLES 2 TO 5 =====');

    FOR v_i IN 2..5 LOOP
        FOR v_j IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(
                LPAD(v_i || ' x ' || v_j || ' = ' || (v_i * v_j), 15)
            );
        END LOOP;

        DBMS_OUTPUT.PUT_LINE('----------------');
    END LOOP;


    -- =========================================
    -- PART C: Right-angled star triangle
    -- Height = 7
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART C: STAR TRIANGLE =====');

    FOR v_i IN 1..v_height LOOP
        FOR v_j IN 1..v_i LOOP
            DBMS_OUTPUT.PUT('*');
        END LOOP;

        DBMS_OUTPUT.NEW_LINE;
    END LOOP;


    -- =========================================
    -- PART D: Number pyramid
    -- 6 rows
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART D: NUMBER PYRAMID =====');

    FOR v_i IN 1..6 LOOP
        FOR v_j IN 1..v_i LOOP
            DBMS_OUTPUT.PUT(v_j);
        END LOOP;

        DBMS_OUTPUT.NEW_LINE;
    END LOOP;


    -- =========================================
    -- PART E: Reverse star triangle
    -- REVERSE keyword makes rows decrease
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART E: REVERSE STAR TRIANGLE =====');

    FOR v_i IN REVERSE 1..v_height LOOP
        FOR v_j IN 1..v_i LOOP
            DBMS_OUTPUT.PUT('*');
        END LOOP;

        DBMS_OUTPUT.NEW_LINE;
    END LOOP;

END;
/

-- OUTPUT:

-- ===== PART A: TABLE OF 9 =====
-- 9 x 1 = 9
-- 9 x 2 = 18
-- 9 x 3 = 27
-- 9 x 4 = 36
-- 9 x 5 = 45
-- 9 x 6 = 54
-- 9 x 7 = 63
-- 9 x 8 = 72
-- 9 x 9 = 81
-- 9 x 10 = 90
-- 9 x 11 = 99
-- 9 x 12 = 108
-- 9 x 13 = 117
-- 9 x 14 = 126
-- 9 x 15 = 135
-- 9 x 16 = 144
-- 9 x 17 = 153
-- 9 x 18 = 162
-- 9 x 19 = 171
-- 9 x 20 = 180

-- ===== PART B: TABLES 2 TO 5 =====
--      2 x 1 = 2
--      2 x 2 = 4
--      2 x 3 = 6
--      2 x 4 = 8
--      2 x 5 = 10
--      2 x 6 = 12
--      2 x 7 = 14
--      2 x 8 = 16
--      2 x 9 = 18
--     2 x 10 = 20
-- ----------------
--      3 x 1 = 3
--      3 x 2 = 6
--      3 x 3 = 9
--      3 x 4 = 12
--      3 x 5 = 15
--      3 x 6 = 18
--      3 x 7 = 21
--      3 x 8 = 24
--      3 x 9 = 27
--     3 x 10 = 30
-- ----------------
--      4 x 1 = 4
--      4 x 2 = 8
--      4 x 3 = 12
--      4 x 4 = 16
--      4 x 5 = 20
--      4 x 6 = 24
--      4 x 7 = 28
--      4 x 8 = 32
--      4 x 9 = 36
--     4 x 10 = 40
-- ----------------
--      5 x 1 = 5
--      5 x 2 = 10
--      5 x 3 = 15
--      5 x 4 = 20
--      5 x 5 = 25
--      5 x 6 = 30
--      5 x 7 = 35
--      5 x 8 = 40
--      5 x 9 = 45
--     5 x 10 = 50
-- ----------------

-- ===== PART C: STAR TRIANGLE =====
-- *
-- **
-- ***
-- ****
-- *****
-- ******
-- *******

-- ===== PART D: NUMBER PYRAMID =====
-- 1
-- 12
-- 123
-- 1234
-- 12345
-- 123456

-- ===== PART E: REVERSE STAR TRIANGLE =====
-- *******
-- ******
-- *****
-- ****
-- ***
-- **
-- *