CREATE OR REPLACE FUNCTION fn_stadium_team_name(stadium_name VARCHAR(30))
RETURNS TABLE (team_name VARCHAR(45))
AS
    $$
    BEGIN
        RETURN QUERY
        SELECT
        t.name AS team_name
        FROM teams AS t
        JOIN stadiums s on s.id = t.stadium_id
        WHERE stadium_name = s.name
        ORDER BY t.name;
    END;
    $$
LANGUAGE plpgsql;