SELECT
   c.last_name,
    CEIL(AVG(bg.rating)) AS average_rating,
    p.name AS publisher_name
FROM creators AS c
JOIN creators_board_games cbg on c.id = cbg.creator_id
JOIN board_games bg on bg.id = cbg.board_game_id
JOIN publishers p on p.id = bg.publisher_id
WHERE p.name = 'Stonemaier Games'
GROUP BY c.last_name, p.name
ORDER BY average_rating DESC