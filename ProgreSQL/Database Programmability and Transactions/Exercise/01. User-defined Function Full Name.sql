CREATE OR REPLACE FUNCTION fn_full_name(first_name VARCHAR, last_name VARCHAR)
RETURNS  VARCHAR
AS
$$
BEGIN
     RETURN INITCAP(LOWER(first_name)) || ' ' || INITCAP(LOWER(last_name));
END;
$$

LANGUAGE plpgsql;

SELECT fn_full_name('fred', 'sanford')