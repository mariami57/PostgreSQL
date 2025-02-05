SELECT
    c.full_name,
    COUNT(DISTINCT c2.car_id) AS count_of_cars,
    SUM(c2.bill) AS total_sum
FROM clients AS c
JOIN courses c2 on c.id = c2.client_id
WHERE SUBSTRING(c.full_name, 2,1) = 'a'
GROUP BY c.full_name
HAVING COUNT(DISTINCT c2.car_id) > 1
ORDER BY full_name