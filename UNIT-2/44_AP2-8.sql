SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'roank';
    v_roll NUMBER := 44;

    v_salary NUMBER := 52000;
    v_existing_emi NUMBER := 5000;
    v_loan NUMBER := 2000000;
    v_annual_rate NUMBER := 8.5;
    v_tenure NUMBER := 60;

    v_monthly_rate NUMBER;
    v_emi NUMBER;
    v_foir_limit NUMBER;
    v_available_emi NUMBER;
    v_approved_loan NUMBER;
    v_decision VARCHAR2(20);
    v_iterations NUMBER := 0;
BEGIN

    -- Monthly interest rate
    v_monthly_rate := v_annual_rate / 12 / 100;

    -- FOIR limit = 40% of monthly salary
    v_foir_limit := v_salary * 0.40;

    -- EMI available after existing EMI
    v_available_emi := v_foir_limit - v_existing_emi;

    -- Calculate EMI for requested loan
    v_emi := v_loan * v_monthly_rate *
             POWER(1 + v_monthly_rate, v_tenure) /
             (POWER(1 + v_monthly_rate, v_tenure) - 1);

    v_approved_loan := v_loan;

    -- =========================================
    -- Check salary and loan eligibility
    -- =========================================

    IF v_salary < 25000 THEN

        v_decision := 'REJECTED';
        v_approved_loan := 0;

    ELSE

        -- =====================================
        -- WHILE LOOP reduces loan by Rs.10,000
        -- until EMI fits available FOIR
        -- =====================================

        WHILE v_emi > v_available_emi
              AND v_approved_loan > 0 LOOP

            v_approved_loan := v_approved_loan - 10000;
            v_iterations := v_iterations + 1;

            v_emi := v_approved_loan * v_monthly_rate *
                     POWER(1 + v_monthly_rate, v_tenure) /
                     (POWER(1 + v_monthly_rate, v_tenure) - 1);

        END LOOP;

        -- =====================================
        -- CASE determines final decision
        -- =====================================

        v_decision := CASE
            WHEN v_approved_loan = 0 THEN 'REJECTED'
            WHEN v_approved_loan < v_loan THEN 'CONDITIONAL'
            ELSE 'APPROVED'
        END;

    END IF;

    -- =========================================
    -- Print loan affordability report
    -- =========================================

    DBMS_OUTPUT.PUT_LINE('===== LOAN AFFORDABILITY CHECKER =====');
    DBMS_OUTPUT.PUT_LINE('Name              : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No           : ' || v_roll);
    DBMS_OUTPUT.PUT_LINE('Monthly Salary    : Rs.' || v_salary);
    DBMS_OUTPUT.PUT_LINE('Existing EMI      : Rs.' || v_existing_emi);
    DBMS_OUTPUT.PUT_LINE('Requested Loan    : Rs.' || v_loan);
    DBMS_OUTPUT.PUT_LINE('Annual Rate       : ' || v_annual_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Tenure            : ' || v_tenure || ' months');

    DBMS_OUTPUT.PUT_LINE(
        'FOIR Limit (40%)  : Rs.' || ROUND(v_foir_limit)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Available EMI     : Rs.' || ROUND(v_available_emi)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Requested EMI     : Rs.' || ROUND(
            v_loan * v_monthly_rate *
            POWER(1 + v_monthly_rate, v_tenure) /
            (POWER(1 + v_monthly_rate, v_tenure) - 1)
        )
    );

    DBMS_OUTPUT.PUT_LINE(
        'Approved Amount   : Rs.' || v_approved_loan
    );

    DBMS_OUTPUT.PUT_LINE(
        'Approved EMI      : Rs.' || ROUND(v_emi)
    );

    DBMS_OUTPUT.PUT_LINE(
        'Loan Reductions   : ' || v_iterations
    );

    DBMS_OUTPUT.PUT_LINE(
        'Decision           : ' || v_decision
    );

    DBMS_OUTPUT.PUT_LINE(
        'Monthly Cost      : Existing EMI Rs.' ||
        v_existing_emi || ' + New EMI Rs.' || ROUND(v_emi)
    );

END;
/

-- OUTPUT:
-- ===== LOAN AFFORDABILITY CHECKER =====
-- Name              : Mishri Amrutiya
-- Roll No           : 52
-- Monthly Salary    : Rs.52000
-- Existing EMI      : Rs.5000
-- Requested Loan    : Rs.2000000
-- Annual Rate       : 8.5%
-- Tenure            : 60 months
-- FOIR Limit (40%)  : Rs.20800
-- Available EMI     : Rs.15800
-- Requested EMI     : Rs.41033
-- Approved Amount   : Rs.770000
-- Approved EMI      : Rs.15798
-- Loan Reductions   : 123
-- Decision           : CONDITIONAL
-- Monthly Cost      : Existing EMI Rs.5000 + New EMI Rs.15798