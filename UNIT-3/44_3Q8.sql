SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_publishers (
        p_country VARCHAR2
    ) IS
        SELECT pub_id, pub_name, city, country
        FROM publisher
        WHERE UPPER(country) = UPPER(p_country);

    v_found BOOLEAN := FALSE;

BEGIN
    FOR r_pub IN c_publishers('&country')
    LOOP
        v_found := TRUE;

        DBMS_OUTPUT.PUT_LINE(
            'Publisher ID: ' || r_pub.pub_id ||
            ' | Name: ' || r_pub.pub_name ||
            ' | City: ' || r_pub.city ||
            ' | Country: ' || r_pub.country
        );
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE(
            'No publisher found in ' || '&country'
        );
    END IF;
END;
/

-- TEST:
-- Enter value for country: India

-- OUTPUT:
-- Publisher ID: 20 | Name: Tech Bharat Pub | City: Pune | Country: India
-- Publisher ID: 40 | Name: Vidya Prakashan | City: Ahmedabad | Country: India