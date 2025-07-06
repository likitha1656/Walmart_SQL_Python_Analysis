-- The goal is to explore sales performance, customer behavior, and profit patterns across Walmart branches using SQL analysis.

use walmart;
select * from walmart limit 1;
SHOW TABLES;

------------------------------------------------

-- Total Sales by Branch
SELECT 
branch, 
SUM(total) AS total_sales
FROM walmart
GROUP BY branch
ORDER BY total_sales DESC;

WALM009	25688.34
WALM074	25555.42
WALM003	24950.559999999998

--------------------------------------------

-- Total Sales by City
SELECT 
    city, 
    SUM(total) AS total_sales
FROM walmart
GROUP BY city
ORDER BY total_sales DESC;

Weslaco	46351.79
Waxahachie	40703.33
Plano	25688.34

--------------------------------------------------
-- Total Sales by Category
SELECT 
category, 
SUM(total) AS total_sales
FROM walmart
GROUP BY category
ORDER BY total_sales DESC;

Fashion accessories	489480.89999999997
Home and lifestyle	489250.06
Electronic accessories	78175.02999999998

-----------------------------------------------------------
-- Quantity Sold per Category
SELECT 
category, 
SUM(quantity) AS total_quantity_sold
FROM walmart
GROUP BY category
ORDER BY total_quantity_sold DESC;


Fashion accessories	9653
Home and lifestyle	9610
Electronic accessories	1494

---------------------------------------------------

-- Average Profit Margin by Category
SELECT 
    category, 
    ROUND(AVG(profit_margin), 2) AS avg_profit_margin
FROM walmart
GROUP BY category
ORDER BY avg_profit_margin DESC;

Health and beauty	0.4
Food and beverages	0.4
Electronic accessories	0.39

-------------------------------------------------------
-- Average Profit Margin by Branch
SELECT 
branch, 
ROUND(AVG(profit_margin), 2) AS avg_profit_margin
FROM walmart
GROUP BY branch
ORDER BY avg_profit_margin DESC;

WALM052	0.57
WALM051	0.52
WALM031	0.48

--------------------------------------------------
Peak hours:

SELECT 
  CASE
    WHEN TIME(time) BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN TIME(time) BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
    WHEN TIME(time) BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
    ELSE 'Other'
  END AS time_of_day,
  COUNT(*) AS total_transactions
FROM walmart
GROUP BY time_of_day
ORDER BY total_transactions DESC;

Afternoon	4636
Evening	3246
Morning	2087

--------------------------------------------------------
most Used Payment Method
SELECT 
    payment_method, 
    COUNT(*) AS total_transactions
FROM walmart
GROUP BY payment_method
ORDER BY total_transactions DESC;


Credit card	4256
Ewallet	3881
Cash	1832

---------------------------------------------------------
Average Rating by Branch

SELECT 
branch, 
ROUND(AVG(rating), 2) AS avg_rating
FROM walmart
GROUP BY branch
ORDER BY avg_rating DESC;

WALM004	7
WALM076	6.81
WALM059	6.73

---------------------------------------------
Total Sales by Day of the Week

SELECT 
    DAYNAME(date) AS day_of_week,
    SUM(total) AS total_sales
FROM walmart
GROUP BY day_of_week
ORDER BY total_sales DESC;

Thursday	179250.02999999997
Sunday	177879.58
Friday	176055.56999999998

---------------------------------------------------
Total Sales per Category in Each City

SELECT 
city,
category,
SUM(total) AS total_sales
FROM walmart
GROUP BY city, category
ORDER BY city, total_sales DESC;





