SELECT
    p.id,
    p.title,
    pi.duration,
    ROUND(pi.budget,1) AS budget,
    to_char(pi.release_date, 'MM-YY') AS release_date
FROM productions AS p
JOIN productions_info pi ON p.production_info_id = pi.id
WHERE pi.release_date BETWEEN '2023-01-01' AND '2024-12-31' AND pi.budget > 1500000.00
ORDER BY budget ASC, duration DESC, p.id ASC
LIMIT 3;