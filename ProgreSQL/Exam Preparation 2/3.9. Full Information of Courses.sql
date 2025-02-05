SELECT
    a.name AS adress,
    CASE
        WHEN extract(HOUR FROM c.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END as day_time,
    c.bill,
    c2.full_name,
    c3.make,
    c3.model,
    c4.name AS category_name
FROM addresses AS a
JOIN courses c on a.id = c.from_address_id
JOIN clients c2 on c2.id = c.client_id
JOIN cars c3 on c3.id = c.car_id
JOIN categories c4 on c3.category_id = c4.id
ORDER BY c.id