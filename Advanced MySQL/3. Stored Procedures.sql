-- Stored Procedures
# save your SQL code so you can use it over and over again
# saving complex queries and enhancing overall code
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries() -- see in stored procedures in schemas on the left hand side
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries(); -- way to call a stored procedure or click on bolt button in schemas

DELIMITER $$
CREATE PROCEDURE higher_salaries()
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 50000;
    SELECT *
    FROM employee_salary
    WHERE salary >= 10000;
END $$
DELIMITER ; -- use delimiter to terminate the procedure till the very end and not stop before the previous statements

CALL higher_salaries();

# one more way to create the stored procedures is by right clicking it and write the query in it and click on apply & finish

-- Parameters in Stored Procedures
# In MySQL, passing parameters means sending values into or out of a stored procedure 
# so it can work dynamically instead of using fixed values.

DELIMITER $$
CREATE PROCEDURE large_salaries2(p_employee_id INT)
BEGIN
     SELECT salary
     FROM employee_salary
     WHERE employee_id=p_employee_id;
END $$
DELIMITER ;

CALL large_salaries2(1);


     

