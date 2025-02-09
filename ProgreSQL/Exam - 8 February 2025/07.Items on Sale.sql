SELECT
    i.name,
    UPPER(b.name) || '/' || LOWER(c.name) AS promotion,
    concat('On sale: ', i.description) AS description,
    i.quantity
FROM items AS i
JOIN brands b on b.id = i.brand_id
JOIN classifications c on c.id = i.classification_id
LEFT JOIN orders_items oi on i.id = oi.item_id
WHERE oi.item_id IS NULL
ORDER BY i.quantity DESC, i.name;
