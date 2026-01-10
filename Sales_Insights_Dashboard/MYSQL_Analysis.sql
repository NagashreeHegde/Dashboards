/*
 PROJECT: Sales Insights – Data Analysis Using SQL
 PURPOSE: Data preparation, validation, and business analysis

 1. SCHEMA CLEANUP & DATA PREPARATION
   - Fix column issues
   - Add keys
   - Create normalized revenue column
*/

-- Rename wrong column
ALTER TABLE customers
RENAME COLUMN custmer_name TO customer_name;

-- Add primary key
ALTER TABLE transactions
ADD transaction_id INT AUTO_INCREMENT PRIMARY KEY;

-- Add normalized column
ALTER TABLE transactions
ADD COLUMN norm_sales_amount DECIMAL(15,2);

-- Disable safe updates (required for bulk update)
SET SQL_SAFE_UPDATES = 0;

-- Populate normalized sales amount based on currency
UPDATE transactions
SET norm_sales_amount =
    CASE 
        WHEN currency = 'INR' THEN sales_amount
        WHEN currency = 'USD' THEN sales_amount * 75
        ELSE sales_amount
    END
WHERE transaction_id IS NOT NULL;

/*  2. BASIC DATA VALIDATION & SANITY CHECKS
   - Ensure data is loaded and looks correct   
   ------------------------------------------------*/

SELECT * FROM customers;
SELECT * FROM transactions;

-- Show total number of customers
SELECT COUNT(*) FROM customers;

-- Show transactions where currency is US dollars
SELECT * 
FROM transactions 
WHERE currency = 'USD';

-- Transactions with Negative Profit to Detect loss-making sales.
SELECT * 
FROM transactions
WHERE profit_margin < 0
ORDER BY profit_margin;

/* 3. MARKET-LEVEL BASIC EXPLORATION
--------------------------------------------*/

-- Show transactions for Chennai market (market code for chennai is Mark001)
SELECT * 
FROM transactions 
WHERE market_code = 'Mark001';

-- Show distinct product codes that were sold in Chennai
SELECT DISTINCT product_code 
FROM transactions 
WHERE market_code = 'Mark001';

-- Sales Above ₹1,000,000
SELECT * 
FROM transactions
WHERE norm_sales_amount > 1000000
ORDER BY norm_sales_amount DESC;

/* 4. TIME-BASED ANALYSIS USING DATE DIMENSION
---------------------------------------------------*/

-- Show transactions in 2020 join by date table
SELECT t.*, d.*
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year = 2020;

-- Show total revenue in year 2020
SELECT SUM(t.norm_sales_amount) AS total_revenue_2020
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year = 2020;

-- Show total revenue in year 2020, January Month
SELECT SUM(t.norm_sales_amount) AS total_revenue_jan_2020
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year = 2020
  AND d.month_name = 'January';

-- Show total revenue in year 2020 in Chennai
SELECT SUM(t.norm_sales_amount) AS total_revenue_2020_chennai
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year = 2020
  AND t.market_code = 'Mark001';

-- YEAR 2020 Total Sales Amount validation (₹142M)
SELECT 
    ROUND(SUM(t.norm_sales_amount) / 1000000, 2) AS revenue_2020_million
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year = 2020;

/*
 5. CORE BUSINESS KPIs (EXECUTIVE LEVEL)
-------------------------------------------*/

-- What is the total revenue for the selected period?
SELECT 
    ROUND(SUM(t.norm_sales_amount) / 1000000, 2) AS total_revenue_million
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year IN (2017, 2018, 2019, 2020);

-- Total Revenue by Year
SELECT 
    d.year,
    SUM(t.norm_sales_amount) AS total_revenue
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
GROUP BY d.year
ORDER BY total_revenue DESC;

-- How many total sales transactions occurred?
SELECT 
    COUNT(*) AS total_sales_qty
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year IN (2017, 2018, 2019, 2020);

-- What is the total profit generated?
SELECT 
    ROUND(SUM(t.profit_margin) / 1000000, 2) AS total_profit_million
FROM transactions t
JOIN date d 
    ON t.order_date = d.date
WHERE d.year IN (2017, 2018, 2019, 2020);

/*
 6. MARKET PERFORMANCE ANALYSIS
-----------------------------------------*/

-- Total Profit by Market
SELECT 
    m.markets_name,
    SUM(t.profit_margin) AS total_profit
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY total_profit DESC;

-- PROFIT CONTRIBUTION % BY MARKET
-- It shows how much each market contributes to the company’s total profit.
-- It measures impact, not efficiency.
SELECT 
    m.markets_name,
    ROUND(
        SUM(t.profit_margin) * 100 /
        (SELECT SUM(profit_margin) FROM transactions),
        2
    ) AS profit_contribution_percentage
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY profit_contribution_percentage DESC;

-- PROFIT % BY MARKET
-- It shows how profitable each market is relative to its own sales.
-- It measures efficiency, not overall impact.
SELECT 
    m.markets_name,
    ROUND(
        SUM(t.profit_margin) / SUM(t.norm_sales_amount) * 100,
        2
    ) AS profit_percentage
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY profit_percentage DESC;

/*
 7. CUSTOMER-LEVEL ANALYSIS
---------------------------------------*/

-- Revenue by Customer
SELECT 
    c.customer_name,
    SUM(t.norm_sales_amount) AS revenue
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
GROUP BY c.customer_name
ORDER BY revenue DESC;

-- TOP 5 CUSTOMERS
SELECT 
    c.customer_name,
    SUM(t.norm_sales_amount) AS revenue
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
GROUP BY c.customer_name
ORDER BY revenue DESC
LIMIT 5;

-- Which customers generate higher profit margins?
SELECT 
    c.customer_name,
    ROUND(
        SUM(t.profit_margin) / SUM(t.norm_sales_amount) * 100,
        2
    ) AS profit_margin_percentage
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
GROUP BY c.customer_name
ORDER BY profit_margin_percentage DESC;

/*
 8. GEOGRAPHIC / ZONE ANALYSIS
------------------------------------*/

-- Revenue by Zone
SELECT 
    m.zone,
    ROUND(SUM(t.norm_sales_amount) / 1000000, 2) AS total_revenue_millions
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.zone
ORDER BY total_revenue_millions DESC;
