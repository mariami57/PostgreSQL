SELECT
    id,
    first_name,
    last_name,
    job_title,
    department_id,
    salary
FROM employees
WHERE salary >= 1000 and department_id = 4
ORDER BY id