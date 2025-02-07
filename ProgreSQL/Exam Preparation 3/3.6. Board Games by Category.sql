SELECT
    b.id,
    b.name,
    b.release_year,
    c.name AS category_name
FROM board_games AS b
JOIN categories c on c.id = b.category_id
WHERE c.name IN ('Strategy Games', 'Wargames')
ORDER BY release_year DESC