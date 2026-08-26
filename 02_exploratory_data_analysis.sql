/* 1. Unique Value & Distinct Enumeration
  * Objective: Identify all distinct entries across key categorical variables to understand data scope. */
SELECT *
FROM traffic_accidents_workspace;

SELECT DISTINCT(weather_condition)
FROM traffic_accidents_workspace;

SELECT DISTINCT(lighting_condition)
FROM traffic_accidents_workspace;

SELECT DISTINCT(roadway_surface_cond)
FROM traffic_accidents_workspace;

SELECT DISTINCT(first_crash_type)
FROM traffic_accidents_workspace;

SELECT DISTINCT(crash_type)
FROM traffic_accidents_workspace;

/* 2. Data Aggregation & Column Totals
  * Objective: Calculate overall totals for numerical metrics to establish baseline volume and operational scale. */
SELECT SUM(injuries_total)
FROM traffic_accidents_workspace;

SELECT AVG(injuries_total)
FROM traffic_accidents_workspace;

SELECT SUM(injuries_incapacitating)
FROM traffic_accidents_workspace;

/* 3. Volumetric & Time-Series Distribution
  * Objective: Analyze monthly record counts to observe temporal distribution and spot seasonal patterns. */
SELECT crash_month, COUNT(*) AS total_crashes
FROM traffic_accidents_workspace
GROUP BY crash_month
ORDER BY total_crashes DESC;

/* 4. Incident Analysis & Pattern Investigation
  * Objective: Query the dataset to answer targetes analytical questions regarding accident occurences, factors and trend. */
-- Question 1. Which weather condition has the highest total injuries?
SELECT weather_condition, SUM(injuries_total) AS total_injuries
FROM traffic_accidents_workspace
GROUP BY weather_condition
ORDER BY total_injuries DESC
LIMIT 1;
-- Finding: The weather condition with the highest total injuries is "Clear" with a total of 64,288 injuries.

-- Question 2. Which lighting condition has the highest and lowest incapicitating injuries?
WITH lighting_total AS (
	SELECT lighting_condition, SUM(injuries_incapacitating) AS incap_total
	FROM traffic_accidents_workspace
	GROUP BY lighting_condition)
SELECT lighting_condition, incap_total
FROM lighting_total 
WHERE incap_total = (
	SELECT MAX(incap_total)
    FROM lighting_total)
    OR incap_total = (
    SELECT MIN(incap_total)
    FROM lighting_total)
    ORDER BY incap_total DESC;
/* Finding: Lighting condition with the highest incapacitating injuries is "Daylight" with a total of 4,557 incapacitating injuries
			while "Unknown" has the lowest incapacitating injuries with a total of 60 incapacitating injuries. */

-- Question 3. Which roadway surface condition has the highest number of crashes, and what is the most common primary contributory cause within that condition?
WITH roadway_crashes AS (
	SELECT 
		roadway_surface_cond,
		COUNT(*) AS count_surface
	FROM traffic_accidents_workspace
	GROUP BY roadway_surface_cond
    ORDER BY count_surface DESC
    LIMIT 1
    ),
prim_cause AS (
	SELECT 
        prim_contributory_cause,
		roadway_surface_cond,
        COUNT(*) AS prim_count
	FROM traffic_accidents_workspace
    WHERE roadway_surface_cond = (
		SELECT roadway_surface_cond
        FROM roadway_crashes)
	GROUP BY prim_contributory_cause, roadway_surface_cond
    ORDER BY prim_count DESC)
SELECT  
	prim_contributory_cause, 
	roadway_surface_cond,
	prim_count
FROM prim_cause
WHERE prim_count = (
	SELECT MAX(prim_count)
    FROM prim_cause)  ;
-- Finding: The roadway surface condition with the highest number of crashes is "Dry" and the most common primary contributory cause is "Unable to determine" with a total of 41,610 crashes.

-- Question 4. What is the most common first crash type?
SELECT first_crash_type, COUNT(first_crash_type) AS count_type
FROM traffic_accidents_workspace
GROUP BY first_crash_type
ORDER BY count_type DESC
LIMIT 1;
-- Finding: The most common first crash type is "Turning" with a total of 64,150 crashes.

-- Question 5. Which months have the most and least occurences of the most common crash type?
WITH common_crash AS (
	SELECT 
		crash_type, 
		COUNT(*) AS type_count
	FROM traffic_accidents_workspace
	GROUP BY crash_type
    ORDER BY type_count DESC
    LIMIT 1
    ),
type_month AS (
	SELECT 
		crash_month, crash_type,
		COUNT(*) AS monthly_count
	FROM traffic_accidents_workspace
	WHERE crash_type = (
		SELECT crash_type
        FROM common_crash)
	GROUP BY crash_month, crash_type
    ORDER BY monthly_count DESC)
SELECT crash_month, crash_type, monthly_count
FROM type_month
WHERE monthly_count = (
	SELECT MAX(monthly_count)
    FROM type_month)  
    OR monthly_count = (
    SELECT MIN(monthly_count)
    FROM type_month);
-- The most common crash type is "NO INJURY / DRIVE AWAY" occuring most in "October" with a total of 11,136 and least in "April" with a total of 8,463.



