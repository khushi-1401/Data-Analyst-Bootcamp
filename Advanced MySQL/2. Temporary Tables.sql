-- Temprary Tables
# A temporary table in MySQL is a table that exists only for the duration of a session.
# Once the session ends (or connection closes), the table is automatically deleted.

CREATE TEMPORARY TABLE temp_table
(first_name VARCHAR(50),
last_name VARCHAR(50),
favourite_movie VARCHAR(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Alex','Freberg','The snakes in the city');

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM salary_over_50k;