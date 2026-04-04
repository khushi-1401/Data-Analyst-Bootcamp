-- String Functions
# finding the length of each string using this length function
SELECT LENGTH('skyfall');

SELECT first_name,LENGTH(first_name) as charlen
FROM employee_demographics
ORDER BY charlen;

SELECT first_name,LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

-- Uppercase and Lowercase
# Convert each string into uppercase and lowercase
SELECT UPPER('sky');

SELECT LOWER('SKY');

SELECT first_name,UPPER(first_name) as uppercase
FROM employee_demographics; -- all names are converted to uppercase means in capital letter

-- Trim (get rid of trailing white spaces) LTRIM and RTRIM
SELECT TRIM('      sky      '); # corner to the left hand side
SELECT LTRIM('      sky      '); # corner to the left hand side 
SELECT RTRIM('      sky      '); # left space ridden off and moved towards right

-- Substrings
SELECT first_name,
LEFT(first_name,4), -- first four characters from the left
RIGHT(first_name,4), -- last four characters from the right
SUBSTRING(first_name,3,2), -- from the third postion in the name get two characters 
birth_date,
SUBSTRING(birth_date,6,2) as birth_month
FROM employee_demographics;

-- REPLACE
SELECT first_name,REPLACE(first_name,'a','z') as replaced -- work for lowercase only a will be replaced by z if it exists in name
FROM employee_demographics;

-- Locate
SELECT LOCATE('x','Alexander');

SELECT first_name,LOCATE('An',first_name) as location -- here An will be taken as 1 location because it is in the beginning rest will have 0
FROM employee_demographics;

-- CONCAT connect two strings (Concatenation)
SELECT first_name,last_name,
CONCAT(first_name,' ',last_name) as full_name -- here ' ' means space 
FROM employee_demographics;
