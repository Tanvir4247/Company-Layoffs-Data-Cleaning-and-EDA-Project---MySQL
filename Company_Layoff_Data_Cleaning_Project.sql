-- WORKING WITH NEW TABLE RATHER THAN THE MAIN TABLE --

Create Table additional like layoffs;

INSERT INTO
	additional 
SELECT * FROM layoffs;

SELECT *
FROM additional;


-- REMOVING DUPLICATE ROWS USING CTE -- 

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num FROM additional;

WITH duplicates AS (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num FROM additional
)
SELECT * 
FROM duplicates
WHERE row_num >1;

-- CREATING NEW TABLE TO INSERT A NEW COLUMN TO COUNT THE DUPLICATE ROW --
CREATE TABLE `additional2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO
	additional2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num FROM additional;


SELECT * 
FROM additional2;

DELETE
FROM additional2
WHERE row_num>1;

SELECT * 
FROM additional2
WHERE row_num>1;


-- TRIMING STRINGS CONTAINING EXTRA SPACE IN VALUES OF COMPANY COLUMN --
SELECT company, TRIM(company)
FROM additional2;

SELECT company, TRIM(company)
FROM additiona2
WHERE company != TRIM(company);


UPDATE additional2
SET company = TRIM(company);





-- IDENTYFYING AND UPDATING SIMILAR INDUSTRY NAME
SELECT DISTINCT industry 
FROM additional2;

SELECT DISTINCT industry
FROM additional2
WHERE industry LIKE "crypto%";

UPDATE additional2
SET industry = "Crypto"
WHERE industry LIKE "crypto%";

SELECT DISTINCT industry
FROM additional2
WHERE industry LIKE "crypto%";

SELECT DISTINCT industry 
FROM additional2
ORDER BY industry;



-- IDENTYFYING AND UPDATING SIMILAR COUNTRY NAME

SELECT DISTINCT country
FROM additional2
ORDER BY country;

SELECT *
FROM additional2
WHERE country = 'United States.';

UPDATE additional2
SET country = "United States"
WHERE country LIKE "United States%";

SELECT  concat(location,' ', country) 
FROM additional2
ORDER BY location,country;

SELECT *
FROM additional;





-- ALTER TABLE additional
-- ADD COLUMN is_duplicate BOOLEAN DEFAULT FALSE;

-- WITH duplicates AS (
--     SELECT 
--         company,
--         location,
--         industry,
--         total_laid_off,
--         percentage_laid_off,
--         `date`,
--         stage,
--         country,
--         funds_raised_millions,
--         ROW_NUMBER() OVER (
--             PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions
--         ) AS row_num
--     FROM additional
-- )
-- UPDATE additional
-- JOIN duplicates ON 
--     additional.company = duplicates.company AND
--     additional.location = duplicates.location AND
--     additional.industry = duplicates.industry AND
--     additional.total_laid_off = duplicates.total_laid_off AND
--     additional.percentage_laid_off = duplicates.percentage_laid_off AND
--     additional.`date` = duplicates.`date` AND
--     additional.stage = duplicates.stage AND
--     additional.country = duplicates.country AND
--     additional.funds_raised_millions = duplicates.funds_raised_millions
-- SET additional.is_duplicate = TRUE
-- WHERE duplicates.row_num > 1;

-- ALTER TABLE additional
-- DROP COLUMN is_duplicate;







-- CHANGING DATA TYPE OF DATE COLUMN FROM STRING TO DATE --
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM additional2;

UPDATE 
additional2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE additional2
MODIFY COLUMN `date` DATE;






-- IDENTIFYING IF THERE IS ANY VALUE THAT NEED TRIMMING
SELECT stage, TRIM(stage)
FROM additional2;


SELECT stage, TRIM(stage) AS trimmed_stage
FROM additional2
WHERE stage != TRIM(stage);


UPDATE additional2
SET company = TRIM(company);



SELECT DISTINCT industry
FROM additional2
ORDER BY industry;

SELECT *
FROM additional2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

UPDATE additional2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM additional2
WHERE industry IS NULL 
OR industry = ''
ORDER BY industry;

SELECT a1.company, a1.industry, a2.company, a2.industry
FROM additional2 a1
JOIN additional2 a2
ON a1.company = a2.company
WHERE a1.industry IS NULL
AND a2.industry IS NOT NULL;

SELECT a1.company, a1.industry, a2.company, a2.industry
FROM additional2 a1
JOIN additional2 a2
ON a1.company = a2.company
WHERE a1.industry IS NULL
AND a2.industry IS NOT NULL;

UPDATE additional2 a1
JOIN additional2 a2
ON a1.company = a2.company
SET a1.industry = a2.industry
WHERE a1.industry IS NULL
AND a2.industry IS NOT NULL;

