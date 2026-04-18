-- Exploratory Data Analysis
# We go for data cleaning and EDA together at the same time but we have cleaned the data first now we are exploring this
SELECT *
FROM layoffs_staging2;

# look at the column total_laid_off 
SELECT MAX(total_laid_off),MAX(percentage_laid_off)
FROM layoffs_staging2; 
# maximum percentage of people laid off is 100% or 1 meaning the entire company was laid off
# maximum total laid off is 12000 

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off=1
ORDER BY total_laid_off DESC;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off=1
ORDER BY funds_raised_millions DESC;

SELECT company,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
# we selected the company and grouped them by the sum of the total laid off ones 

# the date duration when the company did layoffs
SELECT MIN(`date`),Max(`date`)
FROM layoffs_staging2;
# look at the previous query to look which company did the layoff

# similarly look for the industry that had a major impact on it
SELECT industry,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;
# Look USA did the most layoffs followed by India and so on

# look the year that had the most layoffs
SELECT YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;
# 2022 had the largest number of people that were laid off

SELECT stage,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;
# which stage the layoff was high Post-IPO

SELECT company,AVG(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;
# average of the companies that laid off in grouped format

SELECT SUBSTRING(`date`,6,2) AS `MONTH`,SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY `MONTH`
ORDER BY 1 DESC;
# here we grouped the months of all the years to look for the layoffs per month in total 

SELECT *
FROM layoffs_staging2;

SELECT SUBSTRING(`date`,1,7) AS `MONTH`,SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;
# sum of each month by year in ascending order

WITH Rolling_Total AS
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`,SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`,total_off,SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;
# rolling total over month like for first month the same and the next one has the previous month added into it

SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC;


WITH Company_Year (company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC
)
SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
ORDER BY Ranking ASC;
# first group by years then ranking based on each year collectively
# per company the sum total and per year group by


-- other way of writing thesame thing in a CTE

WITH Company_Year (company,years,total_laid_off) AS
(
SELECT company,YEAR(`date`),SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC
),Company_Year_Rank AS
(
SELECT *,
DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5;# based on ranking of each year which company laid off the most & also giving the top five 









