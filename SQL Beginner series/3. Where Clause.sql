-- WHERE CLAUSE 
SELECT * 
FROM parks_and_recreation.employee_salary
WHERE first_name='Leslie'; 
# = is a comparison operator

SELECT * 
FROM parks_and_recreation.employee_salary
WHERE salary>=50000; 
# >,<,> or =,< or =

SELECT * 
FROM employee_demographics
WHERE gender !='Female';
# != not equal to

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01';

-- Logical operators
# AND,OR,NOT
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'Male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender != 'Female';

SELECT *
FROM employee_demographics
WHERE (first_name='Leslie' AND age=44) OR age > 55;

-- LIKE STATEMENT- Pattern Matching
# % - special character for anything
# _ - special character for specific values

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%';


