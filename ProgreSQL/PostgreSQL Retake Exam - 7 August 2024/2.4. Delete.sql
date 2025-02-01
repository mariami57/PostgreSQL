DELETE from countries
WHERE id IN (
    SELECT
    c.id
    FROM countries AS c
LEFT JOIN actors a on c.id = a.country_id
LEFT JOIN productions p on c.id = p.country_id
WHERE a.country_id IS NULL AND p.country_id IS NULL
    )