SELECT * FROM parks_and_recreation.employee_demographics;
# write the database.table to specify which table you are selecting from which database

# select columns in a proper format to avoid confusion
# we can perform calculations using select statements
SELECT first_name,
last_name,
birth_date,
age,
(age+10)*10+10
FROM parks_and_recreation.employee_demographics;
# PEMDAS (Paranthesis,Exponent,Multiplication,Division,Addition,Subtraction)

#Distinct keyword is used to retrieve unique values either in pair of columns or within a single column
SELECT first_name
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name,gender
FROM parks_and_recreation.employee_demographics;



