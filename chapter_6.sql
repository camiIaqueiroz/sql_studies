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
