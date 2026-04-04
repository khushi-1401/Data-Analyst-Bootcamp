-- UNION
# allows you to combine rows of data from same or separate tables using select statements
SELECT age,gender
FROM employee_demographics
UNION
SELECT first_name,last_name
FROM employee_salary; -- bad data everything got combined according to the columns we specified

SELECT first_name,last_name
FROM employee_demographics
UNION DISTINCT               -- by default union is distinct
SELECT first_name,last_name
FROM employee_salary; 

SELECT first_name,last_name
FROM employee_demographics
UNION ALL              -- now duplicates won't be removed all the names will be printed from each table
SELECT first_name,last_name
FROM employee_salary;

-- Multiple unions together

SELECT first_name,last_name, 'Old Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender='Male'
UNION
SELECT first_name,last_name, 'Old Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender='Female'
UNION
SELECT first_name,last_name,'Highly Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name,last_name;

    


