SELECT
    a.name AS animal,
    to_char(a.birthdate, 'YYYY') AS birth_year,
    at.animal_type
FROM animals AS a
JOIN animal_types at on at.id = a.animal_type_id
WHERE a.owner_id IS NULL
  AND  age('01/01/2022', a.birthdate) < '5 year'
  AND at.animal_type <> 'Birds'
ORDER BY a.name;