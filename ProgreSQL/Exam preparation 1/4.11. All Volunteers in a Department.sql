
CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INT
AS
    $$
    DECLARE volunteer_num INT;
    BEGIN
        volunteer_num :=
            (SELECT
                COUNT(v.name) 
                FROM volunteers AS v
                JOIN volunteers_departments vd on v.department_id = vd.id
                WHERE vd.department_name = searched_volunteers_department);
        RETURN volunteer_num;
    END;
    $$
LANGUAGE plpgsql;

SELECT fn_get_volunteers_count_from_department('Education program assistant')