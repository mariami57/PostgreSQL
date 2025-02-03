CREATE TABLE gift_recipients (
    id INT GENERATED ALWAYS AS IDENTITY  PRIMARY KEY,
    name VARCHAR(76),
    country_id INT REFERENCES countries ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    gift_sent BOOLEAN DEFAULT FALSE
);

INSERT INTO gift_recipients(name, country_id, gift_sent)
 SELECT
     c.first_name || ' ' || c.last_name AS name,
     c.country_id AS country_ID,
     CASE
         WHEN country_id IN (7, 8, 14, 17, 26) THEN TRUE
         ELSE FALSE
     END AS gift_sent   
FROM customers AS c