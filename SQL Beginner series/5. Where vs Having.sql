-- GROUP BY vs HAVING 
SELECT gender,AVG(age)
FROM employee_demographics  -- error in this query
WHERE AVG(age)>40
GROUP BY gender;
# Here the group needs to happen first followed by aggregate function and then the male category
# with the avg that is 41.2857 will be displayed if we use having clause

SELECT gender,AVG(age)
FROM employee_demographics  -- this query is correct
GROUP BY gender
HAVING AVG(age)>40;

SELECT occupation,AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%Manager%' -- where-> group by-> having
GROUP BY occupation
HAVING AVG(salary)>75000;




