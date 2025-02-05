SELECT
    t.id AS team_id,
    t.name AS team_name,
    COUNT(p.team_id) AS player_count,
    t.fan_base
FROM teams AS t
LEFT JOIN players p on t.id = p.team_id
WHERE t.fan_base > 30000
GROUP BY t.id, t.name, t.fan_base
ORDER BY player_count DESC, fan_base DESC