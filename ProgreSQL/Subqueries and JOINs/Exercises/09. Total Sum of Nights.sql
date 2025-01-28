SELECT
    a.name,
    sum(booked_for) AS sum
FROM apartments AS a
JOIN bookings AS b USING (apartment_id)
GROUP BY a.name
ORDER BY a.name