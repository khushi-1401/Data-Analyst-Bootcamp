-- TRiggers and Events
# A trigger lets you update the data in other table when it is freshly upadated in a new table
# Ron Swanson has a record in salary table but we will add his data in employee_demographics table
SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	   AFTER INSERT ON employee_salary
       FOR EACH ROW
BEGIN
	 INSERT INTO employee_demographics (employee_id,first_name,last_name)
     VALUES(NEW.employee_id,NEW.first_name,NEW.last_name);
END $$
DELIMITER ;

# for each row means every new row that gets added the data will be updated in demographics table
 INSERT INTO employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
 VALUES(13,'Paul-Mescal','Jones','Entertainment 360 CEO',1000000,NULL);
 
 -- EVENTS
 # A Trigger happens when an event takes place while an event is something that is scheduled
SELECT *
FROM employee_demographics;

# county council made a rule to delete the record of an employee whose age is >=60 and take them as retired
DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND  -- for year or month or time you want 
DO
BEGIN
     DELETE
     FROM employee_demographics
     WHERE age >= 60;
END $$
DELIMITER ; -- Jerry had an age of 61 

SHOW VARIABLES LIKE 'event%'; # if issue prevails do this the event_scheduler must be ON
# Edit>Preferences>SQL editor>undo the last check box !

