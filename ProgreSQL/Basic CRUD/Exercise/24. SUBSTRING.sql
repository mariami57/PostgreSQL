CREATE VIEW view_initials AS
    SELECT
        LEFT(first_name, 2) as initial,
        last_name
    FROM employees
ORDER BY last_name;
