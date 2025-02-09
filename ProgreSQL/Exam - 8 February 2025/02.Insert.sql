INSERT INTO items(name, quantity, price, description, brand_id, classification_id)
SELECT
    'Item' || created_at AS name,
    customer_id AS quantity,
    rating * 5 AS price,
    NULL  AS description,
    item_id AS brand_id,
    (SELECT MIN(item_id) FROM reviews) AS classigication_id
FROM reviews
ORDER BY item_id
LIMIT 10;