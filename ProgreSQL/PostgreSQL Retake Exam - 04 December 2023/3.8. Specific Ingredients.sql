SELECT
    i.name AS ingredient_name,
    p.name AS product_name,
    d.name AS distributor_name
FROM ingredients AS i
JOIN products_ingredients pi on i.id = pi.ingredient_id
JOIN products p on pi.product_id = p.id
JOIN distributors d on d.id = i.distributor_id
WHERE i.name ILIKE 'mustard%' AND d.country_id = 16
ORDER BY product_name