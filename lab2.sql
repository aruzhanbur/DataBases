\c lab2;

CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100),
    region_id INTEGER,
    population INTEGER
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('South Korea', 1, 20000000);

INSERT INTO countries (country_name)
VALUES ('UK');

INSERT INTO countries (country_name, region_id, population)
VALUES ('Australia', NULL, 25000000)

INSERT INTO countries (country_name, region_id, population)
VALUES
       ('USA', 27, 50000000),
       ('Chine', 102, 45000000),
       ('Somali', 13, 40000000);

ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (region_id, population)
VALUES (3, 1000000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new AS
SELECT * FROM countries
WHERE FALSE;

INSERT INTO countries_new
SELECT * FROM countries;

UPDATE countries_new
SET region_id = 1
WHERE region_id IS NULL;

SELECT country_name, population * 1.1 FROM countries;

SELECT * FROM countries;

SELECT * FROM countries_new;

DELETE FROM countries
WHERE population < 1000000;

DELETE FROM countries_new
WHERE country_id IN (SELECT country_id FROM countries)
RETURNING *;

DELETE FROM countries
RETURNING *;