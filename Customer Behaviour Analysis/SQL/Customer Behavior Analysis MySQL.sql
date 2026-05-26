USE customer_behavior;

-- =========================================================
-- CUSTOMER BEHAVIOR & REVENUE INSIGHTS ANALYSIS USING SQL
-- =========================================================
-- Project Goal:
-- Analyze customer purchasing behavior to identify
-- revenue-driving segments, customer patterns,
-- product performance, and business opportunities.

-- Skills Used:
-- SQL Aggregations
-- GROUP BY Analysis
-- Subqueries
-- CTEs
-- Window Functions
-- Customer Segmentation
-- Business Analysis
-- Revenue Analysis

-- Dataset Information:
-- Database: customer_behavior
-- Table: customers
-- Total Records: 3900

-- =========================================================
-- 1. REVENUE ANALYSIS
-- =========================================================

-- Q1. Which customer gender contributes the highest revenue?
-- Business Goal: Identify which customer group generates more revenue.

SELECT
    gender,
    ROUND(SUM(purchase_amount_usd), 2) AS revenue
FROM customers
GROUP BY gender
ORDER BY revenue DESC;

-- Insight: Male customers generated higher total revenue compared to female customers.
-- Recommendation: The business can create targeted campaigns based on gender purchasing behavior.



-- Q2. What is the revenue contribution of each age group?
-- Business Goal: Understand which age groups contribute the most revenue.

SELECT
    age_group,
    ROUND(SUM(purchase_amount_usd), 2) AS total_revenue
FROM customers
GROUP BY age_group
ORDER BY total_revenue DESC;

-- Insight: Revenue contribution varies across age groups, indicating differences in customer purchasing behavior.
-- Recommendation: Marketing strategies can be personalized for high-performing age groups.



-- Q3. Which product categories generate the highest revenue?
-- Business Goal: Identify the most profitable product categories.

SELECT
    category,
    ROUND(SUM(purchase_amount_usd), 2) AS total_revenue
FROM customers
GROUP BY category
ORDER BY total_revenue DESC;

-- Insight: Some categories contribute a larger share of total business revenue.
-- Recommendation: High-performing categories can receive increased marketing and inventory focus.



-- Q4. What is the revenue contribution percentage of each category?
-- Business Goal:
-- Measure category-wise contribution to overall revenue.

SELECT
    category,
    ROUND(SUM(purchase_amount_usd), 2) AS revenue,
    ROUND(
        100 * SUM(purchase_amount_usd)
        / SUM(SUM(purchase_amount_usd)) OVER (),
        2
    ) AS revenue_percentage
FROM customers
GROUP BY category
ORDER BY revenue DESC;

-- Insight: Revenue contribution analysis highlights the categories driving overall sales.
-- Recommendation: Businesses can prioritize top revenue-generating categories for growth strategies.



-- =========================================================
-- 2. CUSTOMER BEHAVIOR ANALYSIS
-- =========================================================

-- Q5. Do subscribed customers spend more?
-- Business Goal: Compare spending behavior between subscribers and non-subscribers.

SELECT
    subscription_status,
    COUNT(customer_id) AS total_customers,
    ROUND(SUM(purchase_amount_usd), 2) AS total_revenue,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_revenue
FROM customers
GROUP BY subscription_status
ORDER BY avg_revenue DESC;

-- Insight: Subscribers and non-subscribers showed similar average spending behavior.
-- Recommendation: Improve subscription benefits to increase customer engagement.



-- Q6. Are repeat buyers also likely to subscribe?
-- Business Goal: Analyze whether frequent buyers prefer subscriptions.

SELECT
    subscription_status,
    COUNT(customer_id) AS buyer_count,
    ROUND(
        100.0 * COUNT(customer_id)
        / SUM(COUNT(customer_id)) OVER (),
        2
    ) AS share_percentage
FROM customers
WHERE previous_purchases > 10
GROUP BY subscription_status;

-- Insight: Repeat purchase behavior can help measure customer loyalty patterns.
-- Recommendation: Loyal customers can be targeted with premium membership offers.



-- Q7. Segment customers based on purchase history.
-- Business Goal: Understand customer loyalty distribution.

SELECT
    loyalty_segment,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY loyalty_segment
ORDER BY total_customers DESC;

-- Insight: Loyal and regular shoppers form the majority of customers.
-- Recommendation: Retention campaigns should focus on loyal and high-value customers.



-- Q8. Which customers used discounts but still spent above average?
-- Business Goal: Identify high-value customers who respond positively to discounts.

SELECT
    customer_id,
    purchase_amount_usd
FROM customers
WHERE discount_applied = 'Yes'
    AND purchase_amount_usd > (
        SELECT AVG(purchase_amount_usd)
        FROM customers
    );

-- Insight: Some customers continue spending more even after receiving discounts.
-- Recommendation: Personalized discount campaigns can improve retention for high-value customers.



-- =========================================================
-- 3. PRODUCT PERFORMANCE ANALYSIS
-- =========================================================

-- Q9. Which products have the highest average review ratings?
-- Business Goal: Identify highly rated products preferred by customers.

SELECT
    item_purchased AS product,
    ROUND(AVG(review_rating), 2) AS avg_rating
FROM customers
GROUP BY item_purchased
ORDER BY avg_rating DESC
LIMIT 5;

-- Insight: Top-rated products indicate strong customer satisfaction.
-- Recommendation: Highly rated products can be promoted more aggressively.



-- Q10. Which products are most dependent on discounts?
-- Business Goal: Identify products frequently purchased during discount periods.

SELECT
    item_purchased AS product,
    ROUND(
        100 * SUM(
            CASE
                WHEN discount_applied = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS discount_percentage
FROM customers
GROUP BY item_purchased
ORDER BY discount_percentage DESC
LIMIT 5;

-- Insight: Certain products rely heavily on discounts to drive purchases.
-- Recommendation: Pricing and promotional strategies should be reviewed for these products.



-- Q11. What are the top 3 most purchased products within each category?
-- Business Goal: Identify category-wise best-selling products.

WITH highest_purchased AS (
    SELECT
        category,
        item_purchased AS product,
        COUNT(customer_id) AS total_purchase,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY COUNT(customer_id) DESC
        ) AS item_rank
    FROM customers
    GROUP BY
        category,
        item_purchased
)
SELECT
    item_rank,
    category,
    product,
    total_purchase
FROM highest_purchased
WHERE item_rank <= 3
ORDER BY
    category,
    item_rank;

-- Insight: Top-performing products vary across different categories.
-- Recommendation: Best-selling products should be prioritized for promotions and inventory planning.



-- =========================================================
-- 4. OPERATIONAL & PURCHASE ANALYSIS
-- =========================================================

-- Q12. Compare average purchase amounts between Standard and Express Shipping.
-- Business Goal: Analyze whether faster shipping customers spend more.

SELECT
    shipping_type,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_purchase
FROM customers
WHERE shipping_type IN ('Express', 'Standard')
GROUP BY shipping_type
ORDER BY avg_purchase DESC;

-- Insight: Shipping preference may influence customer spending behavior.
-- Recommendation: Premium delivery options can be promoted to high-value customers.



-- Q13. Which shipping types generate the highest revenue?
-- Business Goal: Measure revenue contribution by shipping type.

SELECT
    shipping_type,
    ROUND(SUM(purchase_amount_usd), 2) AS total_revenue
FROM customers
GROUP BY shipping_type
ORDER BY total_revenue DESC;

-- Insight: Revenue generation varied across shipping methods based on customer delivery preferences.
-- Recommendation: High-performing shipping options can receive operational focus.



-- Q14. What is the average spending by payment method?
-- Business Goal: Understand customer spending behavior across payment methods.

SELECT
    payment_method,
    ROUND(AVG(purchase_amount_usd), 2) AS avg_spend
FROM customers
GROUP BY payment_method
ORDER BY avg_spend DESC;

-- Insight: Spending patterns differ across payment methods.
-- Recommendation: Businesses can optimize payment offers and cashback strategies accordingly.



-- =========================================================
-- 5. HIGH-VALUE CUSTOMER ANALYSIS
-- =========================================================

-- Q15. Who are the highest spending customers?
-- Business Goal: Identify high-value customers for retention and loyalty programs.

SELECT
    customer_id,
    loyalty_segment,
    previous_purchases,
    purchase_amount_usd
FROM customers
ORDER BY purchase_amount_usd DESC
LIMIT 10;

-- Insight: High-spending customers contribute significant business value.
-- Recommendation: Personalized loyalty rewards can improve long-term customer retention.

-- =========================================================
-- FINAL BUSINESS FINDINGS
-- =========================================================

-- Key Findings:
-- 1. Male customers contributed higher overall revenue.
-- 2. Subscription status showed limited impact on average spending.
-- 3. Loyal and regular shoppers formed the largest customer segments.
-- 4. Certain products depended heavily on discounts for purchases.
-- 5. Revenue contribution analysis helped identify high-performing categories.
-- 6. Window functions and ranking analysis identified top products within categories.

-- Conclusion:
-- This project demonstrates how SQL can be used to solve
-- real-world business problems through customer analysis,
-- revenue insights, segmentation, and product performance evaluation.