
SELECT * 
INTO bks
FROM 
(
    SELECT * FROM bike_share_yr_0
    UNION ALL
    SELECT * FROM bike_share_yr_1
) combined_data; 
select dteday,season,b.yr,weekday,hr,rider_type,riders,price,COGS,riders*price as revenue,riders*price-COGS as profit from bks b
left join cost_table c
on b.yr = c.yr


SELECT 
    SUM(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2))) AS total_revenue, 
    SUM(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2)) - CAST(COGS AS DECIMAL(10, 2))) AS total_profit
FROM 
    bks b
LEFT JOIN 
    cost_table c ON b.yr = c.yr;



SELECT 
    season, 
    SUM(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2))) AS revenue, 
    SUM(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2)) - CAST(COGS AS DECIMAL(10, 2))) AS profit
FROM 
    bks b
LEFT JOIN 
    cost_table c ON b.yr = c.yr
GROUP BY 
    season
ORDER BY 
    revenue DESC;



SELECT 
    hr AS hour, 
    COUNT(*) AS total_rentals
FROM 
    bks
GROUP BY 
    hr
ORDER BY 
    total_rentals DESC;


SELECT 
    weekday, 
    COUNT(*) AS total_rentals
FROM 
    bks
GROUP BY 
    weekday
ORDER BY 
    total_rentals DESC;


SELECT 
    rider_type, 
    SUM(CAST(riders AS INT)) AS total_riders, 
    SUM(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2))) AS total_revenue
FROM 
    bks b
LEFT JOIN 
    cost_table c ON b.yr = c.yr
GROUP BY 
    rider_type
ORDER BY 
    total_revenue DESC;


SELECT 
    b.yr, 
    SUM(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2))) AS revenue, 
    SUM(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2)) - CAST(COGS AS DECIMAL(10, 2))) AS profit
FROM 
    bks b
LEFT JOIN 
    cost_table c ON b.yr = c.yr
GROUP BY 
    b.yr
ORDER BY 
    b.yr;


SELECT 
    hr AS hour, 
    AVG(CAST(riders AS INT) * CAST(price AS DECIMAL(10, 2))) AS avg_revenue_per_trip
FROM 
    bks b
LEFT JOIN 
    cost_table c ON b.yr = c.yr
GROUP BY 
    hr
ORDER BY 
    avg_revenue_per_trip DESC;

