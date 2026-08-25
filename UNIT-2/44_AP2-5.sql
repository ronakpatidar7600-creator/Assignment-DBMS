SET SERVEROUTPUT ON;

DECLARE
    v_n NUMBER := 5 + MOD(44, 8);       -- N = 9
    v_a NUMBER := 0;
    v_b NUMBER := 1;
    v_c NUMBER;
    v_i NUMBER := 1;

    v_last NUMBER;
    v_divisor NUMBER;
    v_prime BOOLEAN := TRUE;

    v_num NUMBER := 520;
    v_gcd_b NUMBER := 156;
    v_r NUMBER;

    v_perfect_num NUMBER := 28;
    v_sum NUMBER := 0;
    v_d NUMBER := 1;
BEGIN

    -- =========================================
    -- PART A: First N Fibonacci numbers
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART A: FIBONACCI =====');

    WHILE v_i <= v_n LOOP

        DBMS_OUTPUT.PUT(v_a);

        IF v_i < v_n THEN
            DBMS_OUTPUT.PUT(', ');
        END IF;

        v_c := v_a + v_b;
        v_a := v_b;
        v_b := v_c;

        v_i := v_i + 1;
    END LOOP;

    DBMS_OUTPUT.NEW_LINE;

    -- The Nth Fibonacci number is the previous value
    v_last := v_a - v_b + v_a;

    -- Recalculate last Fibonacci number correctly
    v_a := 0;
    v_b := 1;
    v_i := 1;

    WHILE v_i < v_n LOOP
        v_c := v_a + v_b;
        v_a := v_b;
        v_b := v_c;
        v_i := v_i + 1;
    END LOOP;

    v_last := v_a;

    DBMS_OUTPUT.PUT_LINE('Nth Fibonacci Number: ' || v_last);


    -- =========================================
    -- PART B: Check Nth Fibonacci number prime
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART B: PRIME CHECK =====');

    v_divisor := 2;

    IF v_last < 2 THEN
        v_prime := FALSE;
    ELSE
        WHILE v_divisor <= SQRT(v_last) LOOP

            IF MOD(v_last, v_divisor) = 0 THEN
                v_prime := FALSE;
                EXIT;
            END IF;

            v_divisor := v_divisor + 1;
        END LOOP;
    END IF;

    IF v_prime THEN
        DBMS_OUTPUT.PUT_LINE(v_last || ' is PRIME');
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_last || ' is NOT PRIME');
    END IF;


    -- =========================================
    -- PART C: Print primes from 1 to 100
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART C: PRIMES 1 TO 100 =====');

    v_num := 2;
    v_i := 0;

    WHILE v_num <= 100 LOOP

        v_divisor := 2;
        v_prime := TRUE;

        WHILE v_divisor <= SQRT(v_num) LOOP
            IF MOD(v_num, v_divisor) = 0 THEN
                v_prime := FALSE;
                EXIT;
            END IF;

            v_divisor := v_divisor + 1;
        END LOOP;

        IF v_prime THEN
            DBMS_OUTPUT.PUT(v_num || ' ');
            v_i := v_i + 1;
        END IF;

        v_num := v_num + 1;
    END LOOP;

    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('Total Primes: ' || v_i);


    -- =========================================
    -- PART D: GCD using Euclidean Algorithm
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART D: GCD =====');

    v_num := 520;
    v_gcd_b := 156;

    WHILE v_gcd_b != 0 LOOP
        v_r := MOD(v_num, v_gcd_b);
        v_num := v_gcd_b;
        v_gcd_b := v_r;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('GCD of 520 and 156: ' || v_num);


    -- =========================================
    -- PART E: Perfect Number Check
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== PART E: PERFECT NUMBER =====');

    v_perfect_num := 28;
    v_sum := 0;
    v_d := 1;

    WHILE v_d <= v_perfect_num / 2 LOOP

        IF MOD(v_perfect_num, v_d) = 0 THEN
            v_sum := v_sum + v_d;
        END IF;

        v_d := v_d + 1;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(
        'Sum of divisors of ' || v_perfect_num || ': ' || v_sum
    );

    IF v_sum = v_perfect_num THEN
        DBMS_OUTPUT.PUT_LINE(
            v_perfect_num || ' is a PERFECT NUMBER'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE(
            v_perfect_num || ' is NOT a PERFECT NUMBER'
        );
    END IF;

END;
/

-- OUTPUT:
-- ===== PART A: FIBONACCI =====
-- 0, 1, 1, 2, 3, 5, 8, 13, 21
-- Nth Fibonacci Number: 21
-- ===== PART B: PRIME CHECK =====
-- 21 is NOT PRIME
-- ===== PART C: PRIMES 1 TO 100 =====
-- 2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53
-- 59 61 67 71 73 79 83 89 97
-- Total Primes: 25
-- ===== PART D: GCD =====
-- GCD of 520 and 156: 52
-- ===== PART E: PERFECT NUMBER =====
-- Sum of divisors of 28: 28
-- 28 is a PERFECT NUMBER