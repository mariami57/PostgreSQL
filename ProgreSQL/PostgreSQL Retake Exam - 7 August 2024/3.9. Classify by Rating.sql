SELECT
    p.title,
    CASE
        WHEN pi.rating <= 3.50 THEN 'poor'
        WHEN pi.rating <= 8 THEN 'good'
        ELSE 'excellent'
    END AS rating,
    CASE
        WHEN pi.has_subtitles THEN 'Bulgarian'
        ELSE 'N/A'
    END AS subtitles,
    COUNT(pa.actor_id) AS actors_count
FROM productions AS p
JOIN productions_info pi on p.production_info_id = pi.id
JOIN productions_actors pa on p.id = pa.production_id
GROUP BY p.title, pi.rating, pi.has_subtitles
ORDER BY rating, actors_count DESC, p.title