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
