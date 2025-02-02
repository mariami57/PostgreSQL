CREATE OR REPLACE PROCEDURE udp_awarded_production(production_title VARCHAR(70))
LANGUAGE plpgsql
AS
    $$
    BEGIN
        UPDATE actors
        SET awards = awards + 1
        WHERE id IN(
            SELECT
                pa.actor_id
            FROM productions AS p
            JOIN productions_actors pa on p.id = pa.production_id
            WHERE p.title =production_title
            );
    END;
    $$;