-- SUBQUERIES
SELECT *
FROM employee_demographics
WHERE employee_id IN(               
SELECT employee_id
FROM employee_salary
WHERE dept_id=1);
# IN operator and () is operand which can have only one column
# so if I also try to retrieve the info of another column in operand it will throw an error eg. dept_id

-- display avg salary of each employee side by side to their original salary
SELECT first_name,salary,
(SELECT AVG(salary) 
FROM employee_salary)
FROM employee_salary;

SELECT first_name,salary
FROM employee_salary;

SELECT *
FROM employee_salary;

-- Aggregate functions
SELECT AVG(max_age) AS avg_max_age
FROM(
SELECT 
gender,AVG(age) AS avg_age,MAX(age) AS max_age,MIN(age) AS min_age,COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender)
AS Agg_table;

SELECT gender,AVG(max_age) AS avg_max_age
FROM(
SELECT 
gender,AVG(age) AS avg_age,MAX(age) AS max_age,MIN(age) AS min_age,COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender)
AS Agg_table
GROUP BY gender;
