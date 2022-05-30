-- Write a query that returns an aggregation 
SELECT MixDesc, SUM(Quantity) AS Total
FROM Shipments
-- Group by the relevant column
GROUP BY MixDesc
-------------------------------------------------------------------------------------------------
-- Count the number of rows by MixDesc
SELECT MixDesc, COUNT(MixDesc) 
FROM Shipments
GROUP BY MixDesc;
-------------------------------------------------------------------------------------------------
Correct! DATEDIFF(YYYY, DateOne, DateTwo) will provide the difference between the two dates in years.
-------------------------------------------------------------------------------------------------
-- Return the difference in OrderDate and ShipDate
SELECT OrderDate, ShipDate, 
       DATEDIFF(DD, OrderDate, ShipDate) AS Duration
FROM Shipments
-------------------------------------------------------------------------------------------------
-- Return the DeliveryDate as 5 days after the ShipDate
SELECT OrderDate, 
      DATEADD(DD, 5, ShipDate) AS DeliveryDate
FROM Shipments
-------------------------------------------------------------------------------------------------
ROUDING NUMBERS IN T-SQL 
-> ROUND(number, length [,function])

Como arredondar numero no lado esquerdo do decimal

SELECT DurationSeconds,
ROUND (DurationSeconds, -1) AS RoundToTen, 
ROUND(DurationSeconds, -2) AS RoundToHundred 
FROM Incidents

TRUNCATING Numbers:

TRUNCATE 
17.85 -> 17 

ROUND 
17.85 -> 18

Truncation with ROUND()

The round() function can be used to tanate values when you specify the third argument 

ROUND(number, length [,function])

Set the third value to a non-zero number

Truncation in T-SQL 

SELECT Profit,
ROUND(DurationSeconds, 0) AS RoundingtoWhole
ROUND(DurationSeconds, 0, 1) AS Truncating
FROM Incidents
