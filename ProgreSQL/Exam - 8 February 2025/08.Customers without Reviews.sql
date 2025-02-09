SELECT
    c.id AS customer_id,
    c.first_name || ' ' || c.last_name AS full_name,
    COUNT(o.customer_id) AS total_orders,
    CASE
        WHEN loyalty_card = TRUE THEN 'Loyal Customer'
        ELSE 'Regular Customer'
    END AS loyalty_status
FROM customers AS c
JOIN orders o on c.id = o.customer_id
LEFT JOIN reviews r on c.id = r.customer_id
WHERE r.customer_id IS NULL
GROUP BY c.id, c.first_name, c.last_name
HAVING COUNT(o.customer_id) > 0
ORDER BY total_orders DESC, customer_id;