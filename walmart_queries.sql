use walmart;
select count(*) from walmart;
select * from walmart limit 10;
select distinct payment_method from walmart;
select count(*) as count,payment_method from walmart group by payment_method order by count;
select count(distinct(Branch)) from walmart;

-- SALES BY BRANCH
select  Branch, round(sum(total), 2) as total_sales from walmart group by Branch order by total_sales desc;

-- QUANTITY BY PAYMENT METHOD
select payment_method, count(quantity) as quantity_sold from walmart group by payment_method order by quantity_sold desc;
-- More people are paying with credit cards then e-wallets.

-- Identify the Highest-Rated Category in Each Branch
SELECT * FROM (
    SELECT Branch, category, AVG(rating) AS avg_rating,
           RANK() OVER (PARTITION BY Branch ORDER BY AVG(rating) DESC) AS `rank`
    FROM walmart 
    GROUP BY Branch, category
) AS ranked_categories 
WHERE `rank` = 1;


-- Determine the Busiest Day for Each Branch BASED on num of transactions
select * from (
select Branch, DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%Y'), '%W') as day_name, count(*) as no_of_transactions,
rank() over(partition by Branch order by count(*)  desc) as `rank`
from walmart
group by Branch, day_name) as ranked_categories
where `rank` = 1


-- What are the average, minimum, and maximum ratings of products for each city. list city, avg_rating, min_rating, max_rating

select City, category, avg(rating) as avg_rating, min(rating) as min_rating, max(rating) as max_rating
from walmart
group by category, City
order by City

-- Calculate Total Profit for each category by considering total profit as (unit price * quantity * profit margin)
-- list category and total profit
-- ordered b high to low profit

select category, sum(unit_price * quantity * profit_margin) as total_profit
from walmart
group by category

-- Determine the most common payment method for each branch, display branch, and preferred payment method.
select Branch, preferred_payment_method from (
select Branch, payment_method as preferred_payment_method, count(payment_method),
rank() over (partition by Branch order by count(payment_method) desc) as `rank`
from walmart
group by Branch, payment_method ) as ranked_payment_method
where `rank` = 1

-- categorize sales into 3 group morning, afternoon, evening 
-- find out invoices for each shift

select Branch,
case 
when HOUR(time) between 6 and 11 then 'Morning'
when HOUR(time) between 12 and 17 then 'Afternoon'
when HOUR(time) between 18 and 23 then 'Evening'
else 'Night' 
end as shift, count(invoice_id) as transactions, sum(total) as total_sales
from walmart 
group by Branch, shift
order by Branch, transactions desc


-- identify 5 branch with the high decrease ratio in revenue 
-- compared to last year (current year 2023, last 2022)
WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walmart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;

