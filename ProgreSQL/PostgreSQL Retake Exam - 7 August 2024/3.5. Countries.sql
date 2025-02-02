SELECT
    id,
    name,
    continent,
    currency
FROM countries
WHERE continent = 'South America' AND (currency ILIKE 'P%' OR currency ILIKE 'U%')
ORDER BY currency DESC, id;