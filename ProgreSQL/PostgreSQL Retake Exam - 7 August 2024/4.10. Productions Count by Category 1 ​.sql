CREATE OR REPLACE FUNCTION udf_category_productions_count(category_name VARCHAR(50))
RETURNS TEXT
AS
    $$
    DECLARE total_productions INT;
    BEGIN
        SELECT
            COUNT(cp.production_id) INTO total_productions
        FROM categories AS c
        JOIN categories_productions cp on c.id = cp.category_id
        WHERE c.name = category_name;
        RETURN 'Found ' || total_productions || ' productions.';
    END;
    $$
LANGUAGE plpgsql;

SELECT udf_category_productions_count('Nonexistent') AS message_text;
SELECT udf_category_productions_count('History') AS message_text;