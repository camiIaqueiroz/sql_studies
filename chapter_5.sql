*INTERMEDIATE SQL SERVER*

-- Calculate the average, minimum and maximum
SELECT AVG(DurationSeconds) AS Average, 
       MIN(DurationSeconds) AS Minimum, 
       MAX(DurationSeconds) AS Maximum
FROM Incidents


------------------------------------------------------------------------------------------------------------------------------

-- Calculate the aggregations by Shape
SELECT Shape,
       AVG(DurationSeconds) AS Average, 
       MIN(DurationSeconds) AS Minimum, 
       MAX(DurationSeconds) AS Maximum
FROM Incidents
GROUP BY Shape
-- Return records where minimum of DurationSeconds is greater than 1
HAVING MIN(DurationSeconds) > 1

------------------------------------------------------------------------------------------------------------------------------
-- Return the specified columnsS
SELECT *
FROM Incidents
-- Exclude all the missing values from IncidentState  
WHERE IncidentState IS NOT NULL

------------------------------------------------------------------------------------------------------------------------------
-- Check the IncidentState column for missing values and replace them with the City column
SELECT IncidentState, ISNULL(IncidentState,City) AS Location
FROM Incidents
-- Filter to only return missing values from IncidentState
WHERE IncidentState IS NULL;

------------------------------------------------------------------------------------------------------------------------------

-- Replace missing values 
SELECT Country, COALESCE(IncidentState, City, 'Unknown') AS Location
FROM Incidents
WHERE Country IS NULL

------------------------------------------------------------------------------------------------------------------------------


SELECT Country, 
       CASE WHEN Country = 'us'  THEN 'USA'
       ELSE 'Internacional'
       END AS SourceCountry
FROM Incidents

------------------------------------------------------------------------------------------------------------------------------

-- Complete the syntax for cutting the duration into different cases
SELECT DurationSeconds, 
-- Start with the 2 TSQL keywords, and after the condition a TSQL word and a value
      CASE WHEN (DurationSeconds <= 120) THEN 1
-- The pattern repeats with the same keyword and after the condition the same word and next value          
       WHEN (DurationSeconds > 120 AND DurationSeconds <= 600) THEN 2
-- Use the same syntax here             
       WHEN (DurationSeconds > 601 AND DurationSeconds <= 1200) THEN 3
-- Use the same syntax here               
       WHEN (DurationSeconds > 1201 AND DurationSeconds <= 5000) THEN 4
-- Specify a value      
       ELSE 5 
       END AS SecondGroup   
FROM Incidents

------------------------------------------------------------------------------------------------------------------------------
