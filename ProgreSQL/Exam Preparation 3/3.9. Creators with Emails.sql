SELECT
    c.first_name || ' ' || c.last_name AS full_name,
    c.email,
    MAX(bg.rating) AS rating
FROM creators AS c
JOIN creators_board_games cbg on c.id = cbg.creator_id
JOIN board_games bg on bg.id = cbg.board_game_id
WHERE c.email LIKE '%.com'
GROUP BY c.first_name, c.last_name, c.email
ORDER BY full_name