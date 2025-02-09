CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT
AS
    $$
    DECLARE num_photos INT;
    BEGIN
        SELECT
            COUNT(ap.account_id) INTO num_photos
        FROM accounts AS a
        JOIN accounts_photos ap on a.id = ap.account_id
        WHERE a.username = account_username;
        RETURN num_photos;
    END;
    $$
LANGUAGE plpgsql;