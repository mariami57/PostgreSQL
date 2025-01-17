SELECT
    replace(mountain_range,'a', '@') AS replace_a,
    replace(mountain_range,'A', '$') AS replace_$
FROM mountains;