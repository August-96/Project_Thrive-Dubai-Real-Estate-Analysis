--#to count total number of unique location names and id
SELECT
    COUNT(DISTINCT location_name) AS distinct_location_names,
    COUNT(DISTINCT location_id) AS distinct_location_ids
FROM
    [dbo].[PRODATAcsv];

--INSIGHTS: there are 186 distinct location names and IDs in the dataset

--#to know locations that sold the highest number of villa
SELECT
    count(trans_id) as trans_count, 
	location_name,
    prop_type   
FROM 
	[dbo].[PRODATAcsv]
WHERE
    prop_type = 'Villa'
GROUP BY
    location_name,
    prop_type
ORDER BY
    trans_count desc;
 
 --INSIGHTS: Villa transactions are most popular in these 5 locations (Al Barsha South Fourth, Al Barsha South Fifth,
	--Jabal Ali First, Madinat Al Mataar, Mirdif) and Palm Jumeirah as 6th most popular in villa sales.


--#to know which year made the highest number of transactions
SELECT
    YEAR(transaction_date) AS trans_year,
    COUNT(*) AS trans_count
FROM
   [dbo].[Transactionss]
GROUP BY
    YEAR(transaction_date)
ORDER BY
    trans_count desc;

--INSIGHTS: 2023, 2022, 2013, 2009, and 2021 had the highest number of transactions over the past 20 years.

-- #Transaction Types Breakdown:
SELECT trans_type, COUNT(trans_id) AS transaction_count
FROM [dbo].[PRODATAcsv]
GROUP BY trans_type
ORDER BY transaction_count desc;

--INSIGHTS: there were over three times more sales transactions than other types of transactions

--#Property type distribution
SELECT prop_type, COUNT(trans_id) AS transaction_count
FROM [dbo].[PRODATAcsv]
GROUP BY prop_type
ORDER BY transaction_count desc;

--INSIGHTS: there was three times more transactions of Unit than other property types.

--#top locations by transaction count
SELECT location_name, COUNT(trans_id) AS transaction_count
FROM [dbo].[PRODATAcsv]
GROUP BY location_name
ORDER BY transaction_count DESC;

--INSIGHTS: Marsa Dubai, Business Bay, Al Thanyah Fifth, Al Barsha South Fourth and Burj Khalifa are 5 top locations.

-- #transactions by property type for a particular location
select prop_type, COUNT(trans_id) AS transaction_count
FROM [dbo].[PRODATAcsv]
WHERE location_name = 'Marsa Dubai'
GROUP BY prop_type
ORDER BY transaction_count DESC;

--INSIGHTS: Unit is most popular property type.

-- number of transactions by month
SELECT 
  MONTH(trans_date) AS month,
  COUNT(trans_id) AS transaction_count
FROM [dbo].[PRODATAcsv]
GROUP BY MONTH(trans_date)
ORDER BY transaction_count DESC;

--INSIGHTS: more transactions occurs towards the last quarter of the year than any other quarter.


--transactions by property sub type.
SELECT prop_stype, COUNT(trans_id) AS transaction_count
FROM [dbo].[PRODATAcsv]
GROUP BY prop_stype
ORDER BY transaction_count DESC;

--INSIGHTS: Flat, Villa, Office space, Hotel apartment and Shops are most popular sub types.





