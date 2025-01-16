SELECT DISTINCT on (name)
    name,
    area as area_km2
FROM cities
ORDER BY name DESC;