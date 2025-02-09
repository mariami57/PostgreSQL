CREATE OR REPLACE FUNCTION udf_classification_items_count(classification_name VARCHAR(30))
RETURNS TEXT
AS
    $$
    DECLARE
        num_items INT;
        result TEXT;
    BEGIN
         SELECT
             COUNT(c.id) INTO num_items
             FROM items AS i
             JOIN classifications c on c.id = i.classification_id
             WHERE c.name = classification_name;
         IF
             num_items = 0 THEN result := 'No items found.';
         ELSE
             result := 'Found ' || num_items || ' items.';
         END IF;
        RETURN result;
    END;
    $$
LANGUAGE plpgsql;