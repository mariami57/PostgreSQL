UPDATE products
SET price = price * 1.1
WHERE id IN (
    SELECT
        p.id
    FROM products AS p
    JOIN feedbacks f on p.id = f.product_id
    WHERE f.rate > 8
    );