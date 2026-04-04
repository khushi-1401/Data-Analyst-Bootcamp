-- CASE Statements
# When you have a lot of cases to handle precisely just like if-else

SELECT first_name,last_name,age,
CASE
WHEN age <= 30 THEN 'Young'
WHEN age BETWEEN 31 AND 50 THEN 'Old'
WHEN age >= 50 THEN "Death's Door"
END AS Age_Bracket
FROM employee_demographics;

-- Pay Increase
-- <50000 = 5%
-- >50000 = 7%
-- Finance Bonus = 10%

SELECT first_name,last_name,salary,
CASE
WHEN salary < 50000 THEN salary + (salary*0.05)
WHEN salary > 50000 THEN salary + (salary*0.07)
END AS New_Salary
FROM employee_salary;

SELECT first_name,last_name,salary,
CASE
WHEN salary < 50000 THEN salary*1.05
WHEN salary > 50000 THEN salary*1.07 -- basic maths take salary as a common term and solve it 1 + 0.07 or 0.05
END AS New_Salary
FROM employee_salary;
-- salary + (salary*0.05)
-- salary(1+(1*0.05))
-- salary(1+0.05)
-- salary*1.05 

# Next case if an employee belongs to Finance department they get a bonus of 10%
SELECT first_name,last_name,salary,
CASE
WHEN salary < 50000 THEN salary*1.05
WHEN salary > 50000 THEN salary*1.07 
END AS New_Salary,
CASE
WHEN dept_id=6 THEN salary*0.10 -- taking about bonus so 10% of original salary is his bonus
END AS Bonus
FROM employee_salary;

