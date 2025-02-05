SELECT
    c.first_name || ' ' || c.last_name AS coach_full_name,
    p.first_name || ' ' || p.last_name AS player_full_name,
    t.name AS team_name,
    sd.passing,
    sd.shooting,
    sd.speed
FROM coaches AS c
JOIN players_coaches pc on c.id = pc.coach_id
JOIN players p on p.id = pc.player_id
JOIN teams t on t.id = p.team_id
JOIN skills_data sd on sd.id = p.skills_data_id
ORDER BY coach_full_name, player_full_name DESC