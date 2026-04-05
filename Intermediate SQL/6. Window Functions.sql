-- Window Functions
# first find the average salary of each gender
SELECT dem.gender, AVG(sal.salary) as avg_salary
FROM employee_demographics as dem
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id
GROUP BY gender;

SELECT dem.first_name,dem.last_name,dem.gender, AVG(sal.salary) as avg_salary
FROM employee_demographics as dem
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id
GROUP BY dem.first_name,dem.last_name,dem.gender; -- individual avg salary

SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

# same task by taking OVER() and remove group by
# here we got avg salary of each column not specified just by gender
SELECT dem.gender, AVG(sal.salary) OVER()
FROM employee_demographics as dem
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;

# we use partition by gender here just an addition to above function & get avg salary of each gender in a partition
SELECT dem.first_name,dem.last_name,dem.gender, AVG(sal.salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem -- here no column got affected only the parition function did its work 
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;

SELECT dem.first_name,dem.last_name,dem.gender,
SUM(sal.salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem  
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;
-- here we did sum of salaries partitioned by gender

SELECT dem.employee_id,dem.first_name,dem.last_name,dem.gender,sal.salary,
SUM(sal.salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total -- rolling_Total is simply add + prev
FROM employee_demographics as dem  
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;

SELECT dem.employee_id,dem.first_name,dem.last_name,dem.gender,sal.salary,
ROW_NUMBER() OVER()                    -- this will give number in series starting i 1 just like serial number
FROM employee_demographics as dem  
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;

SELECT dem.employee_id,dem.first_name,dem.last_name,dem.gender,sal.salary,
ROW_NUMBER() OVER(PARTITION BY dem.gender)        -- all females 1,2,3,4            
FROM employee_demographics as dem                 -- all males 1,2,3,4,5,6,7
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;

SELECT dem.employee_id,dem.first_name,dem.last_name,dem.gender,sal.salary,
ROW_NUMBER() OVER(PARTITION BY dem.gender ORDER BY sal.salary DESC)        -- all females 1,2,3,4            
FROM employee_demographics as dem                 -- all males 1,2,3,4,5,6,7
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;
# every partition has salary arranged in desc so is the data in male female rows followed by row number

-- RANK() ,DENSE_RANK()
SELECT dem.employee_id,dem.first_name,dem.last_name,dem.gender,sal.salary,
ROW_NUMBER() OVER(PARTITION BY dem.gender ORDER BY sal.salary DESC) AS row_num,
RANK() OVER(PARTITION BY dem.gender ORDER BY sal.salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY dem.gender ORDER BY sal.salary DESC) AS dense_rank_num                
FROM employee_demographics as dem                 
JOIN employee_salary as sal
ON dem.employee_id=sal.employee_id;
# ROW_NUMBER() -> normal series
# RANK-> differ by position 1,2,3,4,5,5(6),7
# DENSE_RANK-> differ by numericals 1,2,3,4,5,5,6 no matter how many 5's but next will be 6





