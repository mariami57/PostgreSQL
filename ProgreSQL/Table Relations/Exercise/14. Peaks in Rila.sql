SELECT
    m.mountain_range,
    p.peak_name,
    p.elevation
FROM peaks as p
    JOIN mountains as m ON p.mountain_id = m.id
WHERE m.mountain_range = 'Rila'
ORDER BY p.elevation DESC;