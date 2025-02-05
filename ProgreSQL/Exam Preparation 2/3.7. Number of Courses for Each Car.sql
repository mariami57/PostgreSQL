SELECT
    c.id AS car_id,
    c.make,
    c.mileage,
    COUNT(c2.car_id) AS count_of_courses,
    ROUND(AVG(c2.bill),2) AS average_bill
FROM cars AS c
LEFT JOIN courses c2 on c.id = c2.car_id
GROUP BY c.id, c.make, c.mileage
HAVING COUNT(c2.car_id) <> 2
ORDER BY count_of_courses DESC, c.id