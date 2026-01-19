# Sales & Profitability Analysis – Hardware Distributor (Power BI)

> Revenue grew — but over **20% of markets were structurally loss-making**, making scale financially unsafe.

---

## Why This Project Exists

This distributor showed strong revenue growth — yet profit was inconsistent and, in several markets, deeply negative.

High sales volume ≠ healthy business.

This project analyzes **transaction-level sales data** to expose **where profit is actually generated and where revenue actively destroys margin** — across cities, zones, customers, and time periods.

The goal is **decision support**, not storytelling or forecasting.

---

## Core Business Questions

- Which cities and zones generate **real profit** versus surface-level revenue?  
- Which customers appear valuable on sales but **erode overall profitability**?  
- How concentrated is profit across markets?  
- How did **COVID disruptions** in 2020 affect revenue and margins?  
- Is profit driven by pricing power or sheer volume?

---

## Data Overview

- **Period:** Oct 2017 – Jun 2020  
- **Granularity:** Transaction-level sales data  
- **Source:** MySQL database  

### Tables
- `sales_transactions` (fact)  
- `sales_customers`  
- `sales_products`  
- `sales_markets`  
- `sales_date`

---

## Key Metrics Snapshot

| Metric | Overall (2017–2020) | 2020 (Jan–Jun) |
|------|---------------------|---------------|
| Total Revenue | ₹985M | ₹142M |
| Sales Quantity | ~2M units | ~350K units |
| Total Profit | ₹24.7M | ~2.1M |
| Top City by Revenue | Delhi | Delhi |
| Top City by Profit Margin | Surat | Bhubaneshwar |
| Highest Profit Customer | ElectricalSara Stores | ElectricalSara Stores |

> ElectricalSara Stores generates profit primarily through **volume**, not strong margins.

---

## Dashboard Overview

1. [**Executive Sales Overview**](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page1(Key%20Insights).png.png) – revenue trends, YoY comparison, market and city contribution  
   **Purpose:** Separate real profit from misleading revenue.

2. [**Profitability & Margin Analysis**](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page2(ProfitcAnalysis).png) – revenue, total profit, market-level revenue & profit %, customer-level profit table  
   **Purpose:** Identify markets and customers silently losing money.  

3. [**Customer & Market Performance**](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page3(Performance%20Insights).png) – customer-level revenue, profit, margin %, and trends  
   **Purpose:** Decide which customers to protect, renegotiate, or exit.

---

## Dashboard Preview

![Profit Analysis](Sales_Insights_Dashboard/Images/Dashboard_Page2(ProfitcAnalysis).png)

---

## Data Processing & Modeling

### Data Preparation (Power Query)
- Standardized schemas and business keys  
- Currency normalization  
- **Resolved missing/unmatched customer and product keys causing blank revenue and distorted profit**  
- Data consistency checks between fact and dimension tables  

> Fixing these issues revealed previously hidden loss-making transactions.

### Data Model
- Star schema centered on `sales_transactions`  
- Clean one-to-many relationships  
- Designed for **predictable filter propagation and performance**

### DAX Measures
Revenue, Sales Quantity, Profit Margin (%), Revenue Contribution (%), and YoY Revenue for performance comparison.

> All measures **validated against MySQL queries** for accuracy.

---

## Key Insights

### Overall Performance (2017–2020)
- **48.5% of total profit comes from Delhi**, indicating high profit concentration risk  
- Central Zone maintains the most stable and consistently positive margins  
- Several high-revenue cities actively erode profitability through thin or negative margins

### 2020 (COVID Impact)
- Revenue declined sharply from Feb–Jun 2020 following COVID disruptions  
- **Mumbai generated 24% of total profit** despite not being the top revenue city  
- **Bhubaneshwar delivered the highest profit margin**, reflecting efficient pricing or cost control

### Structural Profitability Risks
- **Bengaluru:** Average profit margin of **-21%**, indicating negative unit economics under current pricing and cost structure 
- **Surat:** Historically high-margin city, but profit margin declined by ~80% in 2020, signaling pricing or demand pressure

### Customer Profitability
- **ElectricalSara Stores:** Generates **38% of total profit** at an average margin of **2.25%** — profit driven by scale, not pricing strength  
- **ElectricalLance Stores:** **-2% margin** and **-0.15% profit contribution**, adding revenue while reducing overall profitability  
- **ElectricalQuipo Stores (2020):** **-11.49% margin** and **-5% profit contribution** — commercially unsustainable under current terms

---
## Key Business Takeaway

Nearly **50% of total profit comes from a single city**, while several high-revenue markets consistently destroy margin — making revenue growth an unreliable indicator of business health.

---
## What This Analysis Enables
- Identifies revenue streams that **reduce overall profitability**
- Reframes performance evaluation from **sales volume to profit contribution**
---

## Recommended Actions

- **Exit or renegotiate customers** with sustained margins below **-5%**
- **Freeze expansion in Bengaluru** until unit economics turn positive
- **Cap revenue growth** in cities showing declining margin trends
- **Reduce profit concentration risk** by strengthening mid-margin markets
- Eliminate decision-making based on **revenue metrics without margin context**

> These are **operational decisions**, not analytical suggestions.
---

## Ownership Statement

I designed the data model, validated all KPIs against SQL, and built dashboards used to evaluate city- and customer-level profitability risk.  
This analysis directly informed **strategic, actionable decisions**.

---


## Tools Used

Power BI Desktop, Power Query, DAX, MySQL

---

## About

**Nagashree Hegde**  
Data Analyst | Power BI | SQL | Profitability & Business Analysis  

LinkedIn:  
https://www.linkedin.com/in/nagashree-hegde

---

This project prioritizes **correctness, clarity, and commercial relevance**.  
All insights are directly traceable to **transaction-level data**.
