SELECT
    e.employee_id,
    concat(e.first_name, ' ', e.last_name) AS full_name,
    d.department_id,
    d.name AS department_name
FROM employees as e
RIGHT JOIN departments as d ON e.employee_id = d.manager_id
ORDER BY e.employee_id
LIMIT 5;