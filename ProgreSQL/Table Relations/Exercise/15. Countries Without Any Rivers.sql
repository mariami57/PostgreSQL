SELECT
    COUNT(*)
FROM countries
LEFT JOIN countries_rivers cr on countries.country_code = cr.country_code
WHERE cr.country_code IS NULL;