SELECT
    r.start_point,
    r.end_point,
    r.leader_id,
    c.first_name || ' ' || c.last_name AS leader_name
FROM routes AS r
    JOIN campers as c ON c.id = r.leader_id;