-- Data Cleaning Project
# Data Cleaning is the process of identifying and fixing errors, inconsistencies, and inaccuracies in a dataset to improve its quality before analysis or modeling.
SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the data
-- 3. Null Values or Blank Values
-- 4. Remove any columns (This totally depends on the data) whether you should or should not

CREATE TABLE layoffs_staging
LIKE layoffs;
# copy data from layoffs to layoffs_staging

SELECT *
FROM layoffs_staging;
# here just the table is created same just as layoffs but we need to insert the data

INSERT layoffs_staging
SELECT *
FROM layoffs;
# inserted the data into the table

SELECT *,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging; 
# executing the first task that is to remove the duplicates so partition by all columns

# creating a CTE for this one
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

SELECT *
FROM layoffs_staging
WHERE company='Oda';

SELECT *
FROM layoffs_staging
WHERE company='Casper'; 
# this contains duplicates 

