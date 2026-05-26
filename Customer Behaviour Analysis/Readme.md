# Customer Shopping Behavior & Segmentation Analysis

## Project Overview

An end-to-end analytics project transforming raw retail transaction data into actionable business insights. A retail company collected purchase data for **3,900 customers** but lacked a centralized reporting system.

This project builds an analytics pipeline (**Python → SQL → Power BI**) to clean, analyze, and visualize customer shopping behavior. The solution enables **customer segmentation, revenue tracking, and engagement monitoring** to support sales and marketing strategies.

---

## Business Problem

The retailer observed that different customer groups and product categories behaved differently but could not easily quantify these patterns.

Key goals were to:

- Improve customer retention
- Tailor product strategy
- Boost revenue by understanding:
  - Who customers are
  - How often they buy
  - How much they spend

This project delivers insights needed for **data-driven decision-making** on customer loyalty and product promotions.

---

## Objectives

- **Centralize Customer Analysis**  
  Integrate and prepare data from transactions, demographics, and engagement signals.

- **Segment Customers**  
  Identify meaningful groups by age, purchase frequency, loyalty, and engagement level.

- **Analyze Purchase Patterns**  
  Evaluate spending by gender, age group, product category, payment method, and shipping method.

- **Track Engagement**  
  Compare subscribers vs. non-subscribers, repeat buyers, and promotional behaviors.

- **Build Interactive Reporting**  
  Develop a Power BI dashboard for executives and analysts to dynamically explore insights.

---

## Data & Tools

### Workflow

```text
Python (Pandas, NumPy)
        ↓
MySQL Business Analysis
        ↓
Power BI Dashboarding
```

### Technology Stack

| Category | Tools |
|----------|------|
| Data Cleaning & Feature Engineering | Python, Pandas, NumPy |
| Business Analysis | MySQL |
| Visualization & Reporting | Power BI, DAX |

### Dataset

Retail transaction data for **3,900 unique customers**.

Key attributes include:

- Customer demographics
- Purchased items
- Purchase amount (USD)
- Review ratings
- Subscription status
- Payment methods
- Purchase history
- Shipping preferences

---

## Data Cleaning & Preparation

### 1. Column Standardization

Renamed all columns to **snake_case** for consistency.

Example:

```text
Purchase Amount (USD) → purchase_amount_usd
```

### 2. Missing Value Imputation

Filled missing review ratings using the **median rating within each product category** to maintain statistical integrity rather than dropping data.

### 3. Duplicates & Redundancy Removal

Identified that:

```text
promo_code_used
```

duplicated the same information contained in:

```text
discount_applied
```

The redundant field was removed to simplify downstream analysis.

### 4. Validation Checks

Performed validation checks to ensure data quality:

- Negative purchase amounts
- Impossible review scores
- Negative previous purchase counts
- Inconsistent subscription flags

This guaranteed a clean and reliable dataset before analysis.

---

## Feature Engineering

### Age Group Segmentation

Customers were categorized into:

| Segment | Age Range |
|----------|-----------|
| Young Adult | ≤30 |
| Adult | 31–45 |
| Middle Aged | 46–60 |
| Senior | 61+ |

This segmentation helps reveal which demographic groups drive the highest revenue and engagement.

### Purchase Frequency (Numeric)

Converted textual purchase frequency into numeric days:

| Frequency | Days |
|-----------|------|
| Weekly | 7 |
| Monthly | 30 |
| Quarterly | 90 |

This enabled quantitative engagement analysis.

### Order Value Segments

Purchase amounts were grouped into spending tiers:

| Segment | Spend Range |
|----------|-------------|
| Low | ≤30 USD |
| Medium | 31–60 USD |
| High | 61–80 USD |
| Premium | >80 USD |

### Loyalty Segmentation

Customers were segmented based on previous purchase counts:

| Loyalty Level | Purchase Count |
|---------------|----------------|
| New Buyer | ≤1 |
| Occasional | 2–10 |
| Regular | 11–25 |
| Loyal | 26–40 |
| Top Tier | >40 |

### Engagement Level

A composite engagement score combining:

- Purchase frequency
- Historical purchases
- Subscription status

was used to classify customers into:

- Highly Engaged
- Moderately Engaged
- Low Engagement

---

## SQL Business Analysis

After cleaning and feature engineering, business-focused SQL analysis was conducted in MySQL.

The project includes **SQL queries using aggregations, subqueries, CTEs, and window functions** to answer real business questions.

### Key Findings

### Revenue by Segment

- Male customers generated approximately **68% of total revenue**
- Middle-aged customers contributed the **highest total spend**, identifying them as the core buying demographic

### Category Performance

**Clothing and Accessories** generated the highest revenue contribution.

This insight suggests prioritizing:

- Inventory planning
- Promotions
- Cross-selling opportunities

### Subscription Effects

Findings showed:

- Average purchase value remained similar between subscribers and non-subscribers
- Most customers were non-subscribers

This reveals a major opportunity to improve:

- Membership benefits
- Subscription conversion
- Customer retention

### Loyalty vs Engagement

Many repeat buyers remained **non-subscribers** despite frequent purchases.

This suggests that current loyalty incentives may not be sufficiently compelling.

Potential opportunities include:

- Loyalty rewards
- Exclusive discounts
- Subscription perks

### Shipping & Payment Analysis

Analysis showed:

- Faster shipping methods did **not significantly increase average order value**
- Spending behavior varied across payment methods

These insights help optimize:

- Delivery strategies
- Payment promotions

### Top Customers & Products

The analysis identified:

- Top 10 highest-spending customers
- Best-selling products

Additionally:

> Certain products showed high dependency on discounts to drive purchases.

This insight helps refine:

- Promotional strategies
- Upselling decisions
- Margin optimization

---

## Power BI Dashboard

Developed an **interactive two-page dashboard containing KPI cards, customer segmentation visuals, dynamic field parameters, and operational performance analysis**.

### Page 1 — Executive Overview

Provides a high-level performance snapshot for executives.

Includes:

#### KPI Cards

- Total Customers
- Average Purchase Amount
- Average Rating
- Repeat Customer %
- Highly Engaged Customers

#### Visual Analysis

- Payment Methods
- Shipping Types
- Subscription Breakdown
- Sales by Category

### Dashboard Preview

![Executive Dashboard](https://raw.githubusercontent.com/NagashreeHegde/Dashboards/main/Customer%20Behaviour%20Analysis/Screenshots/Executive%20Summary%20Dashboard.png)

*Executive overview page highlighting KPI tracking and operational metrics.*

---

### Page 2 — Customer Behavior & Segmentation

Provides a deeper analysis of customer profiles.

Visualizations include:

- Loyalty segments (New, Occasional, Regular, Loyal, Top Tier)
- Engagement vs purchase behavior analysis

Dynamic field parameters allow users to switch analysis by:

- Category
- Age Group
- Payment Method
- Shipping Type
- Season

Interactive slicers include:

- Gender
- Season
- Subscription Status
- Category

### Dashboard Preview

![Customer Segmentation Dashboard](https://raw.githubusercontent.com/NagashreeHegde/Dashboards/main/Customer%20Behaviour%20Analysis/Screenshots/Customer%20Behavior%20%26%20Segmentation%20Dashboard.png)

*Customer segmentation dashboard highlighting loyalty, engagement, and spending behavior.*

---

## Key Insights

### Customer Segments Drive Value

Current top-performing customer groups include:

- Middle-aged customers
- Male shoppers
- Loyal repeat buyers

These groups drive a significant share of revenue.

### Engagement Gap

A large share of repeat buyers remain **non-subscribers**, exposing a retention gap.

This presents opportunities for:

- Subscription incentives
- Better loyalty offerings
- Personalized campaigns

### Top Categories

**Clothing and Accessories** outperform other categories in sales.

Recommended focus areas:

- Promotions
- Inventory investment
- Cross-selling strategies

### Discount Dependence

Some products depend heavily on discounts for sales.

This suggests reviewing pricing strategy to protect margins.

### Subscription Impact

Subscribers spend only marginally more than non-subscribers.

This indicates membership value propositions likely need improvement.

---

## Business Recommendations

### 1. Boost Subscription Conversion

Improve subscription value through:

- Exclusive discounts
- Loyalty points
- Checkout incentives

### 2. Target High-Value Segments

Focus marketing on:

- Middle-aged shoppers
- High-spending customers
- Loyal customers

Potential strategies:

- Personalized recommendations
- Email marketing
- Upselling campaigns

### 3. Promote Top Categories

Allocate greater investment toward:

- Clothing
- Accessories

through:

- Promotions
- Featured placements
- Cross-selling

### 4. Retention & Rewards

Develop loyalty systems that encourage occasional buyers to become loyal customers.

Examples:

- Loyalty tiers
- Purchase rewards
- Repeat purchase discounts

### 5. Personalized Engagement

Tailor communication based on engagement level.

| Engagement Level | Strategy |
|---|---|
| Highly Engaged | Premium offers |
| Moderate | Retention nudges |
| Low Engagement | Re-engagement campaigns |

---

## Project Structure

```text
Customer Behaviour Analysis/
│
├── Dataset/
│   ├── customer_shopping_behavior_raw_data.csv
│   └── customer_shopping_behavior_cleaned_data.csv
│
├── Python/
│   └── customer_shopping_behavior_EDA.ipynb
│
├── SQL/
│   └── Customer Behavior Analysis MySQL.sql
│
├── Power BI/
│   └── Customer Behavior Analysis_PowerBI.pbix
│
├── Screenshots/
│   ├── Executive Summary Dashboard.png
│   └── Customer Behavior & Segmentation Dashboard.png
│
└── README.md
```
---

## Tools & Skills

### Languages & Libraries

- Python (**Pandas, NumPy**)
- SQL (**MySQL**)
- DAX
- Power BI

### Analytics Skills

- Data Cleaning
- Feature Engineering
- Customer Segmentation
- KPI Tracking
- Trend Analysis
- Retail Analytics

### Visualization

Designed an interactive Power BI dashboard with:

- Dynamic slicers
- Drill-down capabilities
- KPI tracking
- Segmentation visuals

### Domain

- Retail Analytics
- Customer Behavior Analysis
- Business Intelligence

---

## Future Improvements

### Predictive Modeling

Extend analysis with:

- Customer churn prediction
- Customer lifetime value forecasting

### Real-Time Reporting

Integrate live refresh pipelines for:

- Real-time dashboards
- Automated alerts
- Category performance monitoring

### A/B Testing

Experiment with:

- Subscription incentives
- Promotions
- Personalized offers

to measure business impact.

### Automated Deployment

Automate workflows using orchestration tools such as:

- Airflow

for scheduled data refreshes and reporting.

---

## Conclusion

This project demonstrates a **full-cycle retail analytics workflow** combining:

**Python → SQL → Power BI**

to transform raw customer transaction data into actionable business intelligence.

The analysis supports:

- Customer segmentation
- Revenue tracking
- Engagement monitoring
- Executive reporting
- Strategic decision-making

Future enhancements can expand the project into predictive and real-time analytics for deeper business impact.
---
## Contact

If you'd like to discuss data analytics, business intelligence, or collaboration opportunities, feel free to connect:
-  [LinkedIn](https://linkedin.com/in/nagashree-hegde)
