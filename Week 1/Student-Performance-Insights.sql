CREATE SCHEMA side_project;
SELECT * FROM students_performance;

-- Table Structure --
DESCRIBE students_performance;

-- Data Preview --
SELECT * 
FROM students_performance
LIMIT 10;

-- Total Records --
SELECT COUNT(*) AS total_rows
FROM students_performance; 


-- Combined Categorical Columns Summary
SELECT 'gender' AS column_name, gender AS value, COUNT(*) AS count
FROM students_performance
GROUP BY gender

UNION ALL

SELECT 'race/ethnicity' AS column_name, `race/ethnicity` AS value, COUNT(*) AS count
FROM students_performance
GROUP BY `race/ethnicity`

UNION ALL

SELECT 'parental level of education' AS column_name, `parental level of education` AS value, COUNT(*) AS count
FROM students_performance
GROUP BY `parental level of education`

UNION ALL

SELECT 'lunch' AS column_name, lunch AS value, COUNT(*) AS count
FROM students_performance
GROUP BY lunch

UNION ALL

SELECT 'test preparation course' AS column_name, `test preparation course` AS value, COUNT(*) AS count
FROM students_performance
GROUP BY `test preparation course`;



-- Numerical Columns Summary using UNION ALL ---
SELECT 'math score' AS column_name, MIN(`math score`) AS min_value, MAX(`math score`) AS max_value,
       AVG(`math score`) AS avg_value, STD(`math score`) AS std_dev
FROM students_performance

UNION ALL

SELECT 'reading score' AS column_name, MIN(`reading score`) AS min_value, MAX(`reading score`) AS max_value,
       AVG(`reading score`) AS avg_value, STD(`reading score`) AS std_dev
FROM students_performance

UNION ALL

SELECT 'writing score' AS column_name, MIN(`writing score`) AS min_value, MAX(`writing score`) AS max_value,
       AVG(`writing score`) AS avg_value, STD(`writing score`) AS std_dev
FROM students_performance;


-- Missing Values Check using UNION ALL
SELECT 'gender' AS column_name,
       SUM(CASE WHEN gender IS NULL OR gender = '' THEN 1 ELSE 0 END) AS missing_count
FROM students_performance

UNION ALL

SELECT 'race/ethnicity' AS column_name,
       SUM(CASE WHEN `race/ethnicity` IS NULL OR `race/ethnicity` = '' THEN 1 ELSE 0 END) AS missing_count
FROM students_performance

UNION ALL

SELECT 'parental level of education' AS column_name,
       SUM(CASE WHEN `parental level of education` IS NULL OR `parental level of education` = '' THEN 1 ELSE 0 END) AS missing_count
FROM students_performance

UNION ALL

SELECT 'lunch' AS column_name,
       SUM(CASE WHEN lunch IS NULL OR lunch = '' THEN 1 ELSE 0 END) AS missing_count
FROM students_performance

UNION ALL

SELECT 'test preparation course' AS column_name,
       SUM(CASE WHEN `test preparation course` IS NULL OR `test preparation course` = '' THEN 1 ELSE 0 END) AS missing_count
FROM students_performance

UNION ALL

SELECT 'math score' AS column_name,
       SUM(CASE WHEN `math score` IS NULL THEN 1 ELSE 0 END) AS missing_count
FROM students_performance

UNION ALL

SELECT 'reading score' AS column_name,
       SUM(CASE WHEN `reading score` IS NULL THEN 1 ELSE 0 END) AS missing_count
FROM students_performance

UNION ALL

SELECT 'writing score' AS column_name,
       SUM(CASE WHEN `writing score` IS NULL THEN 1 ELSE 0 END) AS missing_count
FROM students_performance;

--- Data Type ---
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    NUMERIC_PRECISION,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'side_project'
  AND TABLE_NAME = 'students_performance';










