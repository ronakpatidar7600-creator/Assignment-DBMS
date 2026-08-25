SET SERVEROUTPUT ON;

DECLARE
    v_balance NUMBER := 44 * 500 + 5000;   -- Initial balance = Rs.31,000
    v_choice NUMBER := 1;                  -- Simulated menu choice
    v_withdraw NUMBER;

    v_txns NUMBER := 0;                    -- Successful transaction counter
    v_total_withdrawn NUMBER := 0;         -- Running total of withdrawals

BEGIN
    LOOP

        -- Simulated withdrawal transactions
        IF v_choice = 1 THEN

            -- Transaction 1
            v_withdraw := 500;

            -- Check withdrawal amount
            IF v_withdraw <= 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be greater than 0.');

            ELSIF MOD(v_withdraw, 100) <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be a multiple of 100.');

            ELSIF v_withdraw > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal per transaction is Rs.10000.');

            ELSIF v_withdraw > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance.');

            ELSE
                v_balance := v_balance - v_withdraw;
                v_txns := v_txns + 1;
                v_total_withdrawn := v_total_withdrawn + v_withdraw;

                DBMS_OUTPUT.PUT_LINE('--- Transaction Receipt ---');
                DBMS_OUTPUT.PUT_LINE('Withdrawn: Rs.' || v_withdraw);
                DBMS_OUTPUT.PUT_LINE('Balance: Rs.' || v_balance);
            END IF;

            -- Next simulated transaction
            v_choice := 1;

            IF v_txns = 1 THEN
                v_withdraw := 1000;
            END IF;

        ELSIF v_choice = 3 THEN

            DBMS_OUTPUT.PUT_LINE('ATM Exit selected.');

        END IF;

        -- Simulate the remaining withdrawals
        IF v_txns = 1 THEN

            v_withdraw := 1000;

            IF v_withdraw <= 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be greater than 0.');
            ELSIF MOD(v_withdraw, 100) <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be a multiple of 100.');
            ELSIF v_withdraw > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal per transaction is Rs.10000.');
            ELSIF v_withdraw > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance.');
            ELSE
                v_balance := v_balance - v_withdraw;
                v_txns := v_txns + 1;
                v_total_withdrawn := v_total_withdrawn + v_withdraw;

                DBMS_OUTPUT.PUT_LINE('--- Transaction Receipt ---');
                DBMS_OUTPUT.PUT_LINE('Withdrawn: Rs.' || v_withdraw);
                DBMS_OUTPUT.PUT_LINE('Balance: Rs.' || v_balance);
            END IF;
        END IF;

        IF v_txns = 2 THEN

            v_withdraw := 2000;

            IF v_withdraw <= 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be greater than 0.');
            ELSIF MOD(v_withdraw, 100) <> 0 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Withdrawal must be a multiple of 100.');
            ELSIF v_withdraw > 10000 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Maximum withdrawal per transaction is Rs.10000.');
            ELSIF v_withdraw > v_balance THEN
                DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance.');
            ELSE
                v_balance := v_balance - v_withdraw;
                v_txns := v_txns + 1;
                v_total_withdrawn := v_total_withdrawn + v_withdraw;

                DBMS_OUTPUT.PUT_LINE('--- Transaction Receipt ---');
                DBMS_OUTPUT.PUT_LINE('Withdrawn: Rs.' || v_withdraw);
                DBMS_OUTPUT.PUT_LINE('Balance: Rs.' || v_balance);
            END IF;

            -- Fourth iteration: Exit
            v_choice := 3;
        END IF;

        -- EXIT when user chooses Exit or balance becomes zero
        EXIT WHEN v_choice = 3 OR v_balance = 0;

    END LOOP;

    -- Final summary
    DBMS_OUTPUT.PUT_LINE('===== ATM FINAL SUMMARY =====');
    DBMS_OUTPUT.PUT_LINE('Transactions Done : ' || v_txns);
    DBMS_OUTPUT.PUT_LINE('Total Withdrawn   : Rs.' || v_total_withdrawn);
    DBMS_OUTPUT.PUT_LINE('Closing Balance   : Rs.' || v_balance);

END;
/

-- OUTPUT:
-- --- Transaction Receipt ---
-- Withdrawn: Rs.500
-- Balance: Rs.30500
-- --- Transaction Receipt ---
-- Withdrawn: Rs.1000
-- Balance: Rs.29500
-- --- Transaction Receipt ---
-- Withdrawn: Rs.2000
-- Balance: Rs.27500
-- ATM Exit selected.
-- ===== ATM FINAL SUMMARY =====
-- Transactions Done : 3
-- Total Withdrawn   : Rs.3500
-- Closing Balance   : Rs.27500