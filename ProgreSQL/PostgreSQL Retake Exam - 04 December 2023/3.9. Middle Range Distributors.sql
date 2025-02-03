SELECT
    d.name AS distributor_name,
    i.name AS ingredient_name,
    p.name AS product_name,
    AVG(f.rate) AS average_rate
FROM distributors AS d
JOIN ingredients i on d.id = i.distributor_id
JOIN products_ingredients pi on i.id = pi.ingredient_id
JOIN products p on p.id = pi.product_id
JOIN feedbacks f on pi.product_id = f.product_id
GROUP BY d.name, i.name, p.name
HAVING AVG(f.rate) BETWEEN  5 AND 8
ORDER BY distributor_name, ingredient_name, product_name