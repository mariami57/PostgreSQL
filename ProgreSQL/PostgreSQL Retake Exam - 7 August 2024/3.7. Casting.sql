SELECT
    a.first_name || ' ' || a.last_name AS full_name,
    LOWER(SUBSTRING(a.first_name, 1,1)) || SUBSTRING(a.last_name, LENGTH(a.last_name)-1, 2) || LENGTH(a.last_name) || '@sm-cast.com' AS email,
    a.awards
FROM actors AS a
LEFT JOIN productions_actors pa ON a.id = pa.actor_id
WHERE pa.production_id IS NULL
ORDER BY awards DESC, id;