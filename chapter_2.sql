-- Sum the demand_loss_mw column
SELECT 
  SUM (demand_loss_mw) AS MRO_demand_loss
FROM 
  grid 
WHERE
  -- demand_loss_mw should not contain NULL values
  demand_loss_mw is NOT NULL 
  -- and nerc_region should be 'MRO';
  AND nerc_region = 'MRO'; 
  
  ------------------------------------------------------------------------------------------------------------------
  
  -- Obtain a count of 'grid_id'
SELECT 
  COUNT (grid_id) AS grid_total 
FROM 
  grid;
  
  ------------------------------------------------------------------------------------------------------------------
  
  -- Obtain a count of 'grid_id'
SELECT 
  COUNT(grid_id) AS RFC_count
FROM 
  grid
-- Restrict to rows where the nerc_region is 'RFC'
WHERE
  nerc_region = 'RFC';
  
------------------------------------------------------------------------------------------------------------------

-- Find the average number of affected customers
SELECT 
  MAX(affected_customers) AS max_affected_customers 
FROM 
  grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE 
  demand_loss_mw IS NOT NULL;
  
------------------------------------------------------------------------------------------------------------------

-- Find the average number of affected customers
SELECT 
  AVG (affected_customers) AS avg_affected_customers 
FROM 
  grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE 
  demand_loss_mw IS NOT NULL;
  
------------------------------------------------------------------------------------------------------------------  

-- Calculate the length of the description column
SELECT 
  LEN (description) AS description_length 
FROM 
  grid;
  
------------------------------------------------------------------------------------------------------------------
-- Select the first 25 characters from the left of the description column
SELECT 
  LEFT (description, 25) AS first_25_left 
FROM 
  grid;
  
  
 -- Amend the query to select 25 characters from the  right of the description column
SELECT 
  RIGHT(description, 25) AS last_25_right 
FROM 
  grid; 

------------------------------------------------------------------------------------------------------------------

-- Select the region column
SELECT 
  nerc_region,
  -- Sum the demand_loss_mw column
  SUM(demand_loss_mw) AS demand_loss
FROM 
  grid
  -- Exclude NULL values of demand_loss
WHERE 
  demand_loss_mw is NOT NULL
  -- Group the results by nerc_region
GROUP BY 
  nerc_region
  -- Order the results in descending order of demand_loss
ORDER BY 
  demand_loss DESC;
  
------------------------------------------------------------------------------------------------------------------  


SELECT 
  nerc_region, 
  SUM (demand_loss_mw) AS demand_loss 
FROM 
  grid 
  -- Remove the WHERE clause

GROUP BY 
  nerc_region 
  -- Enter a new HAVING clause so that the sum of demand_loss_mw is greater than 10000
HAVING 
 SUM (demand_loss_mw) > 10000 
ORDER BY 
  demand_loss DESC;
  
------------------------------------------------------------------------------------------------------------------


-- Retrieve the minimum and maximum place, and point values
SELECT 
  -- the lower the value the higher the place, so MIN = the highest placing
  MIN(place) AS hi_place, 
  MAX(place) AS lo_place, 
  -- Retrieve the minimum and maximum points values. This time MIN = the lowest points value
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision;
  
  
  
  -- Retrieve the minimum and maximum place, and point values
SELECT 
  -- the lower the value the higher the place, so MIN = the highest placing
  MIN(place) AS hi_place, 
  MAX(place) AS lo_place,  
  -- Retrieve the minimum and maximum points values. This time MIN = the lowest points value
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision
  -- Group by country
GROUP BY
  country;
  
  
  
  -- Obtain a count for each country
SELECT 
  count(country) AS country_count, 
  -- Retrieve the country column
  country, 
  -- Return the average of the Place column 
  AVG(place) AS average_place, 
  AVG(points) AS avg_points, 
  MIN(points) AS min_points, 
  MAX(points) AS max_points 
FROM 
  eurovision 
GROUP BY 
  country;
  
  
  
  
  SELECT 
  country, 
  COUNT (country) AS country_count, 
  AVG (place) AS avg_place, 
  AVG (points) AS avg_points, 
  MIN (points) AS min_points, 
  MAX (points) AS max_points 
FROM 
  eurovision 
GROUP BY 
  country 
  -- The country column should only contain those with a count greater than 5
HAVING 
  COUNT(country) > 5 
  -- Arrange columns in the correct order
ORDER BY 
  avg_place, 
  avg_points DESC;
  
  ------------------------------------------------------------------------------------------------------------------
 
