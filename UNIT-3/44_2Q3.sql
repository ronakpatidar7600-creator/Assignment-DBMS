SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_publishers IS
        SELECT pub_name, city, country
        FROM publisher;

    v_publisher c_publishers%ROWTYPE;
BEGIN
    OPEN c_publishers;

    LOOP
        FETCH c_publishers INTO v_publisher;

        EXIT WHEN c_publishers%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Name: ' || v_publisher.pub_name ||
            ' | City: ' || v_publisher.city ||
            ' | Country: ' || v_publisher.country
        );
    END LOOP;

    CLOSE c_publishers;
END;
/

-- OUTPUT:
-- Name: Oxford Press | City: London | Country: UK
-- Name: Tech Bharat Pub | City: Pune | Country: India
-- Name: McGraw Hill | City: New York | Country: USA
-- Name: Vidya Prakashan | City: Ahmedabad | Country: India
-- Name: Pearson Global | City: Toronto | Country: Canada