CREATE VIEW view_river_info
AS SELECT
    concat_ws(' ', 'The river',  river_name,
              'flows into the',  outflow,  'and is',  "length", 'kilometers long.') AS "River Information"
FROM rivers
ORDER BY river_name;

SELECT
    *
FROM view_river_info;