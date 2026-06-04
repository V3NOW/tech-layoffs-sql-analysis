-- Exploratory Data Analysis (EDA)

SELECT * 
FROM world_layoffs.layoffs_staging2;


-- total max layoffs

SELECT MAX(total_laid_off)
FROM world_layoffs.layoffs_staging2;



-- Max ans Minimum Percentage  layoffs
SELECT MAX(percentage_laid_off),  MIN(percentage_laid_off)
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off IS NOT NULL;

-- Which companies had 100 percent laid off
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1;

-- less than 100%
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 0;

-- order by funds_raised_millions to see how big some of these companies are
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE  percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;



-- USING GROUP BY and ORDER BY
-- Companies with the biggest single Layoff

SELECT company, total_laid_off
FROM world_layoffs.layoffs_staging
ORDER BY 2 DESC
LIMIT 5;

-- Companies with the most Total Layoffs
SELECT company, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY company
ORDER BY 2 DESC
LIMIT 10;



-- by location
SELECT location, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;

-- Date range
SELECT MIN( `date`), MAX(`date`)
FROM world_layoffs.layoffs_staging2;

-- COUNTRY BY THE TOTAL YEARS

SELECT country, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- YEAR 
SELECT YEAR(date), SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY YEAR(date)
ORDER BY 1 ASC;

-- INDUSTRY
SELECT industry, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Layoffs by stage

SELECT stage, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;


-- COMPLEX APPROACH 
-- Companies with the most Layoffs per year
--  


 SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(date) 
  ORDER BY 3 DESC;
  
WITH Company_Year AS 
(
  SELECT company, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY company, YEAR(date)
)
, Company_Year_Rank AS (
  SELECT company, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Company_Year
)
-- Top 3 Ranks for layoffs

SELECT company, years, total_laid_off, ranking
FROM Company_Year_Rank
WHERE ranking <= 3
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- for industries it can be done in similar ways like

 SELECT industry, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY industry, YEAR(date) 
  ORDER BY 3 DESC;
  
WITH Industry_Year AS 
(
  SELECT industry, YEAR(date) AS years, SUM(total_laid_off) AS total_laid_off
  FROM layoffs_staging2
  GROUP BY industry, YEAR(date)
)
, Industry_Year_Rank AS (
  SELECT industry, years, total_laid_off, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS ranking
  FROM Industry_Year
)
-- Top 3 Ranks for layoffs

SELECT industry, years, total_laid_off, ranking
FROM Industry_Year_Rank
WHERE ranking <= 5
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;


-- Rolling Total of Layoffs Per Month
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE SUBSTRING(date,1,7) IS NOT NULL 
GROUP BY dates
ORDER BY dates ASC;

-- USING CTE FOR ROLLING TOOTAL
WITH DATES_CTE AS 
(
SELECT SUBSTRING(date,1,7) as dates, SUM(total_laid_off) AS total_laid_off
FROM layoffs_staging2
WHERE SUBSTRING(date,1,7) IS NOT NULL 
GROUP BY dates
ORDER BY dates ASC
)
SELECT dates, total_laid_off, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
FROM DATES_CTE
ORDER BY dates ASC;
