SELECT
    employee_id,
    concat(e.first_name, ' ', e.last_name) AS full_name,
    project_id,
    p.name AS project_name
FROM employees as e
JOIN employees_projects as ep USING (employee_id)
JOIN projects as p USING (project_id)
WHERE project_id = 1;