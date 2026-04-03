SELECT gender
FROM employee_demographics
GROUP BY gender;
# group by is used to group the columns based on different categories they have

SELECT gender,AVG(age)
FROM employee_demographics
GROUP BY gender;
# used an aggregate function that is average and group it by gender means there should be some relation

SELECT occupation,salary
FROM employee_salary
GROUP BY occupation,salary;

SELECT occupation
FROM employee_salary
GROUP BY occupation;

SELECT salary
FROM employee_salary
GROUP BY salary;

# aggregate functions MIN,MAX,AVG,COUNT
SELECT gender,AVG(age),MIN(age),MAX(age),COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- ORDER BY
SELECT *
FROM employee_demographics
ORDER BY first_name ASC;
# by default the results get sorted in ascending order that is from smallest to largest

SELECT *
FROM employee_demographics
ORDER BY first_name DESC;
# descending order means largest to smallest

SELECT *
FROM employee_demographics 
ORDER BY gender,age;

SELECT *
FROM employee_demographics 
ORDER BY gender,age DESC;
# gender is in asc while age is in desc 

SELECT *
FROM employee_demographics
ORDER BY age,gender; 
# look at the order the age is ordered first then gender which is useless

SELECT *
FROM employee_demographics
ORDER BY 5,4;
# we can use column number instead of writing column names in order by but will become difficult when you have a complex table 





