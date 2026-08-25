SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books IS
        SELECT book_id, title
        FROM book;

BEGIN
    IF c_books%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor already open');
    ELSE
        OPEN c_books;
        DBMS_OUTPUT.PUT_LINE('Cursor was closed, so it is now opened');
    END IF;

    CLOSE c_books;

    IF c_books%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is still open');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursor is now closed');
    END IF;
END;
/

-- OUTPUT:
-- Cursor was closed, so it is now opened
-- Cursor is now closed