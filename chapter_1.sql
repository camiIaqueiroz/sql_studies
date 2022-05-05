[SELECT the country column FROM the eurovision table]

SELECT country
FROM eurovision

---------------------------------------------------------------------------------------------------------------------------------

[Amend your query to return the points column instead of the country column]

SELECT
 points

FROM
 eurovision; 
 
 
 ---------------------------------------------------------------------------------------------------------------------------------
 
 [Use TOP to change the existing query so that only the first 50 rows are returned]

SELECT
 top (50) points 
 
 FROM
  eurovision;
  
---------------------------------------------------------------------------------------------------------------------------------  
  
  
 [Return a list of unique countries using DISTINCT. Give the results an alias of unique_country]

SELECT 
  DISTINCT country  AS unique_country 
FROM 
  eurovision;

---------------------------------------------------------------------------------------------------------------------------------


-- Select the first 5 rows from the specified columns
SELECT 
  TOP (5) description, 
  event_date 
FROM 
  grid 
  -- Order your results by the event_date column
ORDER BY 
  event_date;



---------------------------------------------------------------------------------------------------------------------------------    
  
-- Select the top 20 rows from description, nerc_region and event_date
SELECT 
  TOP (20) description,
  nerc_region,
  event_date
FROM 
  grid 
  -- Order by nerc_region, affected_customers & event_date
  -- Event_date should be in descending order
ORDER BY
  nerc_region,
  affected_customers,
  event_date DESC;  
  
  
  
 --------------------------------------------------------------------------------------------------------------------------------- 

-- Select description and event_year
SELECT 
  description, 
  event_year
FROM 
  grid 
  -- Filter the results
  WHERE 
  description = 'Vandalism';
  
  ---------------------------------------------------------------------------------------------------------------------------------
  
  
  -- Select description and affected customers
SELECT 
  nerc_region, 
  demand_loss_mw 
FROM 
  grid 
  -- Retrieve rows where the event_date was the 22nd December, 2013    
WHERE 
  affected_customers >= 500000;
  
  
 ---------------------------------------------------------------------------------------------------------------------------------
  
  
  -- Select description and affected customers
SELECT 
  description, 
  affected_customers 
FROM 
  grid 
  -- Retrieve rows where the event_date was the 22nd December, 2013    
WHERE 
 event_date = '2013-12-22';
 
---------------------------------------------------------------------------------------------------------------------------------

-- Select description, affected_customers and event date
SELECT 
  description, 
  affected_customers,
  event_date
FROM 
  grid 
  -- The affected_customers column should be >= 50000 and <=150000   
WHERE 
  affected_customers BETWEEN 50000
  AND 150000
   -- Define the order   
ORDER BY 
  event_date DESC;

---------------------------------------------------------------------------------------------------------------------------------

-- Retrieve all columns
SELECT 
  * 
FROM 
  grid 
  -- Return rows where demand_loss_mw is not missing or unknown   
WHERE 
  demand_loss_mw IS NULL;
  

---------------------------------------------------------------------------------------------------------------------------------

-- Retrieve all columns
SELECT 
  * 
FROM 
  grid 
  -- Return rows where demand_loss_mw is not missing or unknown   
WHERE 
  demand_loss_mw IS not NULL;
  
---------------------------------------------------------------------------------------------------------------------------------

-- Retrieve the song,artist and release_year columns
SELECT 
  song, 
  artist, 
  release_year 
FROM 
  songlist 
  -- Ensure there are no missing or unknown values in the release_year column
WHERE 
  release_year IS NOT NULL 
  -- Arrange the results by the artist and release_year columns
ORDER BY 
  artist, 
 release_year;
 
 
 ---------------------------------------------------------------------------------------------------------------------------------
 
 SELECT 
  song, 
  artist, 
  release_year
FROM 
  songlist 
WHERE 
  -- Retrieve records greater than and including 1980
  release_year >= 1980 
  -- Replace AND with OR
  OR release_year <= 1990 
ORDER BY 
  artist, 
  release_year;
  
---------------------------------------------------------------------------------------------------------------------------------  
 
