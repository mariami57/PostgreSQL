CREATE VIEW view_continents_countries_currencies_details AS
SELECT
    concat(cont.continent_name, ': ', cont.continent_code) as continent_details,
    concat_ws(' - ', count.country_name, count.capital, count.area_in_sq_km, 'km2') AS country_information,
    concat(curr.description, ' ', '(', curr.currency_code, ')') AS currencies

FROM continents AS cont,
     countries AS count,
     currencies AS curr
WHERE
    cont.continent_code = count.continent_code
        AND
    count.currency_code = curr.currency_code

ORDER BY country_information, currencies;


SELECT
    *