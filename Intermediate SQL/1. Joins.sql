-- JOINS
SELECT *
FROM employee_demographics;

SELECT * 
FROM employee_salary;

-- INNER JOIN
# Inner join are going to return rows which are same in both columns of both tables 
SELECT *
FROM employee_demographics
INNER JOIN employee_salary
ON employee_demographics.employee_id=employee_salary.employee_id;

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal 
ON dem.employee_id=sal.employee_id; -- use alias for really long names

SELECT dem.employee_id,dem.age,sal.occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal -- use alias to specify which column to be printed from which table
ON dem.employee_id=sal.employee_id;

-- OUTER JOIN(LEFT and RIGHT OUTER JOINS)
SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
ON dem.employee_id=sal.employee_id;
# left join will have all the rows from the left table and matching rows from right table

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
ON dem.employee_id=sal.employee_id;
# right join will have all the rows from the right table nad matching rows from left table

-- SELF JOIN
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id + 1=emp2.employee_id;

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id + 1 = emp2.employee_id;
# For each row in emp1, you are joining it with a row in emp2 whose employee_id is exactly one greater.

-- Joining multiple table together
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal 
ON dem.employee_id=sal.employee_id
INNER JOIN parks_departments AS pd -- here if columns are common we can join them 
ON sal.dept_id=pd.department_id;












