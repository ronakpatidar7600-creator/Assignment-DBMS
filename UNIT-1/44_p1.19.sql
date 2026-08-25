<<bank>>
DECLARE
    -- Anti-Plagiarism Seed Variables
    v_student_name  VARCHAR2(50) := 'Lo Ronak';
    v_roll_no       NUMBER       := 44;
    
    -- Outer Block Level Variables
    v_bank          VARCHAR2(30) := 'LJ Bank';
    v_total_deposit NUMBER       := 0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('     BANK BRANCH HIERARCHY - SCOPE       ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_student_name);
    DBMS_OUTPUT.PUT_LINE('Roll Number  : ' || v_roll_no);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');

    <<branch>>
    DECLARE
        -- Middle Block Level Variables
        v_branch  VARCHAR2(30) := 'Surat';
        v_deposit NUMBER       := v_roll_no * 1000; -- Evaluates to 44,000
    BEGIN
        -- Modify outer block variable using label qualification
        bank.v_total_deposit := bank.v_total_deposit + v_deposit;

        <<counter>>
        DECLARE
            -- Inner Block Level Variables
            v_token NUMBER := 101;
        BEGIN
            -- Proving inner block can read BOTH outer levels
            DBMS_OUTPUT.PUT_LINE('[COUNTER LEVEL - INSIDE INNER BLOCK]');
            DBMS_OUTPUT.PUT_LINE('Bank Name    : ' || bank.v_bank);
            DBMS_OUTPUT.PUT_LINE('Branch Name  : ' || branch.v_branch);
            DBMS_OUTPUT.PUT_LINE('Token Number : ' || v_token);
            DBMS_OUTPUT.PUT_LINE('Added Deposit: Rs.' || LTRIM(TO_CHAR(v_deposit, '99,99,999')));
            DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
        END counter;

        -- OUT-OF-SCOPE ATTEMPT:
        -- Attempting to access v_token here (outside its declaring block) will fail.
        -- DBMS_OUTPUT.PUT_LINE('Token: ' || v_token);

    END branch;

    -- Final total printed at Bank Level
    DBMS_OUTPUT.PUT_LINE('[BANK LEVEL - OUTSIDE ALL INNER BLOCKS]');
    DBMS_OUTPUT.PUT_LINE('Bank Total Deposit: Rs.' || LTRIM(TO_CHAR(v_total_deposit, '99,99,999')));
    DBMS_OUTPUT.PUT_LINE('=========================================');
END bank;
/

''' output 
=========================================
     BANK BRANCH HIERARCHY - SCOPE       
=========================================
Student Name : Lo Ronak
Roll Number  : 44
-----------------------------------------
[COUNTER LEVEL - INSIDE INNER BLOCK]
Bank Name    : LJ Bank
Branch Name  : Surat
Token Number : 101
Added Deposit: Rs.44,000
-----------------------------------------
[BANK LEVEL - OUTSIDE ALL INNER BLOCKS]
Bank Total Deposit: Rs.44,000
========================================='''