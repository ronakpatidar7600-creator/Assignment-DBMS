SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_books_pub IS
        SELECT b.title, p.pub_name, p.country
        FROM book b
        JOIN publisher p
        ON b.pub_id = p.pub_id;

BEGIN
    FOR r_book IN c_books_pub
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Book: ' || r_book.title ||
            ' | Publisher: ' || r_book.pub_name ||
            ' | Country: ' || r_book.country
        );
    END LOOP;
END;
/

-- OUTPUT:
-- Book: Database System Concepts | Publisher: McGraw Hill | Country: USA
-- Book: Let Us Learn PL/SQL | Publisher: Tech Bharat Pub | Country: India
-- Book: Operating System Design | Publisher: McGraw Hill | Country: USA
-- Book: Java Complete Reference | Publisher: McGraw Hill | Country: USA
-- Book: Python for Beginners | Publisher: Tech Bharat Pub | Country: India
-- Book: Computer Networks | Publisher: Oxford Press | Country: UK
-- Book: Data Structures in C | Publisher: Vidya Prakashan | Country: India
-- Book: Oracle SQL Handbook | Publisher: Oxford Press | Country: UK
-- Book: Software Engineering | Publisher: Pearson Global | Country: Canada
-- Book: Web Technology Basics | Publisher: Vidya Prakashan | Country: India
-- Book: Advanced DBMS | Publisher: Pearson Global | Country: Canada
-- Book: Cloud Computing Essentials | Publisher: Oxford Press | Country: UK