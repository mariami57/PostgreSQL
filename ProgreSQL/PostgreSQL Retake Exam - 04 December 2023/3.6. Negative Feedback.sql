SELECT
    f.product_id,
    f.rate,
    f.description,
    f.customer_id,
    c.age,
    c.gender
FROM feedbacks AS f
JOIN customers c on c.id = f.customer_id
WHERE f.rate < 5 AND c.gender = 'F' AND c.age > 30
ORDER BY product_id DESC