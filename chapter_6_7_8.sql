00-- Write a query that returns an aggregation 
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
-------------------------------------------------------------------------------------------------
-- Round Cost to the nearest dollar
SELECT Cost, 
      ROUND(Cost, 0) AS RoundedCost
FROM Shipments
-------------------------------------------------------------------------------------------------
-- Truncate cost to whole number
SELECT Cost, 
       ROUND(Cost, 0, 1) AS TruncateCost
FROM Shipments
-------------------------------------------------------------------------------------------------
-- Return the absolute value of DeliveryWeight
SELECT DeliveryWeight,
       ABS(DeliveryWeight) AS AbsoluteValue
FROM Shipments
-------------------------------------------------------------------------------------------------
-- Return the square and square root of WeightValue
SELECT WeightValue, 
      SQUARE(WeightValue) AS WeightSquare, 
      SQRT (WeightValue) AS WeightSqrt
FROM Shipments
-------------------------------------------------------------------------------------------------
DECLARE @variablename data_type

DataTyper

VARCHAR(n) : variable length text field (bytes)

INT : integer values from -2,147,483,647 to  -2,147,483,647

DECIMAL (p ,s) or NUMERIC (p ,s)

p: total number of decimal digits that will be stored, both to the left and to the right of the decimal point

s: number of decimal digits that will be stored to the right of the decimal point

-------------------------------------------------------------------------------------------------
5. Assigning values to variables
There are two different methods for assigning a value to a variable. You can either use the reserved keyword SET or use SELECT to
assign a value to a variable. When you assign a value to a variable using SET or SELECT there is no result shown. 
To see the value of a variable you need to write a separate SELECT statement to return the value as shown here.
-------------------------------------------------------------------------------------------------
-- Declare the variable (a SQL Command, the var name, the datatype)
DECLARE @counter INT 

-- Set the counter to 20
SET @counter = 20

-- Select and increment the counter by one 
SELECT @counter = @counter + 1 
-- Print the variable
SELECT @counter
-------------------------------------------------------------------------------------------------
DECLARE @counter INT 
SET @counter = 20

-- Create a loop
WHILE @counter < 30

-- Loop code starting point
BEGIN
	SELECT @counter = @counter + 1
-- Loop finish
END

-- Check the value of the variable
SELECT @counter
-------------------------------------------------------------------------------------------------
SELECT a.RecordId, a.Age, a.BloodGlucoseRandom, 
-- Select maximum glucose value (use colname from derived table)    
       b.MaxGlucose
FROM Kidney a
-- Join to derived table
JOIN (SELECT Age, MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney GROUP BY Age) b
-- Join on Age
ON a.Age = b.Age
-------------------------------------------------------------------------------------------------
SELECT *
FROM Kidney a
-- Create derived table: select age, max blood pressure from kidney grouped by age
JOIN (SELECT Age, MAX(BloodPressure) AS MaxBloodPressure
 FROM Kidney
  GROUP BY Age) b
-- JOIN on BloodPressure equal to MaxBloodPressure
ON a.BloodPressure = b.MaxBloodPressure
-- Join on Age
AND a.Age = b.Age
-------------------------------------------------------------------------------------------------
-- Specify the keyowrds to create the CTE
WITH BloodGlucoseRandom (MaxGlucose) 
AS
 (SELECT MAX(BloodGlucoseRandom) AS MaxGlucose FROM Kidney)

SELECT a.Age, b.MaxGlucose
FROM Kidney a
-- Join the CTE on blood glucose equal to max blood glucose
JOIN BloodGlucoseRandom b
ON a.BloodGlucoseRandom = b.MaxGlucose
-------------------------------------------------------------------------------------------------
Create a windows data grouping

OVER (PARTITION BY SalesYear ORDER BY SalesYear) 
