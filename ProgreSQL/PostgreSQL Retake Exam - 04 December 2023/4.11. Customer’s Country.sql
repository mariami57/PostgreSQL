CREATE OR REPLACE PROCEDURE sp_customer_country_name(IN customer_full_name VARCHAR(50), OUT country_name VARCHAR(50))
AS
    $$
    BEGIN
        SELECT
            c2.name INTO country_name
        FROM customers AS c
        JOIN countries c2 on c2.id = c.country_id
        WHERE concat(c.first_name, ' ', c.last_name) = customer_full_name;
    END;
    $$
LANGUAGE plpgsql;