SELECT
    b.name,
    b.rating,
    c.name AS category_name
FROM board_games AS b
JOIN categories c on c.id = b.category_id
JOIN players_ranges pr on pr.id = b.players_range_id
WHERE rating > 7 AND b.name ILIKE '%a%' OR b.rating > 7.5 AND pr.min_players = 2 AND pr.max_players = 5
ORDER BY b.name, b.rating DESC
LIMIT 5