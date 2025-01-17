UPDATE countries
SET
    iso_code = UPPER(LEFT(country_name, 3))
WHERE iso_code is NULL;

SELECT
    iso_code
FROM countries;