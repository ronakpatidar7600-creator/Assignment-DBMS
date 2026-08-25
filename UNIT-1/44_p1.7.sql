<<outer>>
DECLARE
    -- Outer Block Scope Variables
    v_home_district VARCHAR2(30) := 'Surat'; 
    v_num           NUMBER := 100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('     NESTED BLOCKS: SCOPE EXPLORER       ');
    DBMS_OUTPUT.PUT_LINE('=========================================');
    DBMS_OUTPUT.PUT_LINE('1. [OUTER BLOCK LEVEL]');
    DBMS_OUTPUT.PUT_LINE('   District : ' || v_home_district);
    DBMS_OUTPUT.PUT_LINE('   Number   : ' || v_num);
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');

    <<middle>>
    DECLARE
        -- Middle Block Scope Variables (Shadows Outer)
        v_home_district VARCHAR2(30) := 'Ahmedabad'; 
        v_num           NUMBER := 200;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('2. [MIDDLE BLOCK LEVEL]');
        DBMS_OUTPUT.PUT_LINE('   Shadowed District (Middle) : ' || v_home_district);
        DBMS_OUTPUT.PUT_LINE('   Shadowed Number (Middle)   : ' || v_num);
        DBMS_OUTPUT.PUT_LINE('-----------------------------------------');

        <<inner>>
        DECLARE
            -- Inner Block Scope Variables
            v_num NUMBER := 300;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('3. [INNER BLOCK LEVEL]');
            DBMS_OUTPUT.PUT_LINE('   Local Number (Inner)       : ' || v_num);
            DBMS_OUTPUT.PUT_LINE('   Inherited District (Middle): ' || v_home_district);
            DBMS_OUTPUT.PUT_LINE('   Qualified Outer District   : ' || outer.v_home_district);
            DBMS_OUTPUT.PUT_LINE('   Qualified Outer Number     : ' || outer.v_num);
            DBMS_OUTPUT.PUT_LINE('   Qualified Middle Number    : ' || middle.v_num);
        END inner;

    END middle;

    DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
    DBMS_OUTPUT.PUT_LINE('4. [AFTER MIDDLE BLOCK ENDS]');
    DBMS_OUTPUT.PUT_LINE('   Outer District Restored    : ' || v_home_district);
    DBMS_OUTPUT.PUT_LINE('   Outer Number Restored      : ' || v_num);
    DBMS_OUTPUT.PUT_LINE('=========================================');
END outer;
/


'''output

=========================================
     NESTED BLOCKS: SCOPE EXPLORER       
=========================================
1. [OUTER BLOCK LEVEL]
   District : Surat
   Number   : 100
-----------------------------------------
2. [MIDDLE BLOCK LEVEL]
   Shadowed District (Middle) : Ahmedabad
   Shadowed Number (Middle)   : 200
-----------------------------------------
3. [INNER BLOCK LEVEL]
   Local Number (Inner)       : 300
   Inherited District (Middle): Ahmedabad
   Qualified Outer District   : Surat
   Qualified Outer Number     : 100
   Qualified Middle Number    : 200
-----------------------------------------
4. [AFTER MIDDLE BLOCK ENDS]
   Outer District Restored    : Surat
   Outer Number Restored      : 100
========================================= '''