SELECT
    d.first_name,
    d.last_name,
    c.make,
    c.model,
    c.mileage
FROM drivers AS d
JOIN cars_drivers cd on d.id = cd.driver_id
JOIN cars c on c.id = cd.car_id
WHERE mileage IS NOT NULL
ORDER BY mileage DESC, first_name