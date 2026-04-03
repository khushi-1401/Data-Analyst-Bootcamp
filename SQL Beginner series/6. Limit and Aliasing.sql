-- LIMIT and Aliasing
SELECT * 
FROM employee_salary
LIMIT 3;

SELECT * 
FROM employee_salary
LIMIT 2,1; -- leave first two rows and print the third one

SELECT *
FROM employee_salary
ORDER BY salary DESC -- highest salary
LIMIT 3;

SELECT *
FROM employee_salary
ORDER BY salary DESC -- second highest salary
LIMIT 1,1; -- slip first and print only the second

-- Aliasing = Subsequent use of a column name 
SELECT gender,AVG(age) AS avg_age -- it will work if you don't use as 
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

SELECT gender,AVG(age) avg_age -- it will work if you don't use as 
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;



