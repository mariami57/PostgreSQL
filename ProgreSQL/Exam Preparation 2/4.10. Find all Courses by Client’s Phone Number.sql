CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INT
AS
    $$
    DECLARE num_courses INT;
    BEGIN
        SELECT
            COUNT(c2.client_id) INTO num_courses
             FROM clients AS c
        LEFT JOIN courses c2 on c.id = c2.client_id
        WHERE c.phone_number = phone_num
        GROUP BY c.id;
        RETURN num_courses;
    END;
    $$
LANGUAGE plpgsql;