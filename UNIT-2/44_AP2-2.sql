SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(50) := 'ronak';
    v_roll NUMBER := 52;

    v_gross_salary NUMBER := 44 * 50000;
    v_standard_deduction CONSTANT NUMBER := 75000;

    v_taxable_income NUMBER;
    v_tax NUMBER := 0;
    v_tds NUMBER;
    v_monthly_salary NUMBER;

    v_slab NUMBER;
BEGIN
    -- Deduct standard deduction
    v_taxable_income := v_gross_salary - v_standard_deduction;

    -- Calculate tax using SEARCHED CASE
    v_tax := CASE
        WHEN v_taxable_income <= 300000 THEN 0

        WHEN v_taxable_income <= 700000 THEN
            (v_taxable_income - 300000) * 0.05

        WHEN v_taxable_income <= 1000000 THEN
            400000 * 0.05 +
            (v_taxable_income - 700000) * 0.10

        WHEN v_taxable_income <= 1200000 THEN
            400000 * 0.05 +
            300000 * 0.10 +
            (v_taxable_income - 1000000) * 0.15

        WHEN v_taxable_income <= 1500000 THEN
            400000 * 0.05 +
            300000 * 0.10 +
            200000 * 0.15 +
            (v_taxable_income - 1200000) * 0.20

        ELSE
            400000 * 0.05 +
            300000 * 0.10 +
            200000 * 0.15 +
            300000 * 0.20 +
            (v_taxable_income - 1500000) * 0.30
    END;

    -- Monthly TDS
    v_tds := v_tax / 12;

    -- Monthly take-home before other deductions
    v_monthly_salary := (v_gross_salary - v_tax) / 12;

    -- Print complete tax breakdown
    DBMS_OUTPUT.PUT_LINE('===== INCOME TAX CALCULATOR 2024-25 =====');
    DBMS_OUTPUT.PUT_LINE('Name                : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Roll No             : ' || v_roll);

    DBMS_OUTPUT.PUT_LINE(
        'Gross Salary        : Rs.' ||
        TO_CHAR(v_gross_salary, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Standard Deduction  : Rs.' ||
        TO_CHAR(v_standard_deduction, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Taxable Income      : Rs.' ||
        TO_CHAR(v_taxable_income, '99,99,999')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total Tax           : Rs.' ||
        TO_CHAR(v_tax, '99,99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Monthly TDS         : Rs.' ||
        TO_CHAR(v_tds, '99,999.00')
    );

    DBMS_OUTPUT.PUT_LINE(
        'Monthly Take-Home   : Rs.' ||
        TO_CHAR(v_monthly_salary, '99,999.00')
    );

    -- Message when tax is zero
    IF v_tax = 0 THEN
        DBMS_OUTPUT.PUT_LINE(
            'No tax this year - save more with PPF/ELSS!'
        );
    END IF;
END;
/

-- OUTPUT:
-- ===== INCOME TAX CALCULATOR 2024-25 =====
-- Name                : Mishri Amrutiya
-- Roll No             : 52
-- Gross Salary        : Rs.26,00,000
-- Standard Deduction  : Rs.  75,000
-- Taxable Income      : Rs.25,25,000
-- Total Tax           : Rs.  4,77,500.00
-- Monthly TDS         : Rs. 39,791.67
-- Monthly Take-Home   : Rs. 1,85,208.33