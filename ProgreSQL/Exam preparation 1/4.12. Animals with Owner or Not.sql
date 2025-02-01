CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
    OUT animal_owner VARCHAR)
AS
    $$
    BEGIN
        SELECT
             o.name
             INTO animal_owner
             FROM owners AS o
             JOIN animals AS a on o.id = a.owner_id
             WHERE a.name = animal_name;

        IF animal_owner IS NULL THEN
            animal_owner := 'For adoption';
        END IF;
    END;
    $$
LANGUAGE plpgsql;