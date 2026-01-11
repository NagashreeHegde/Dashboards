# Sales Insights & Profitability Analysis – Power BI Dashboard

## Business Context
A multi-city electrical goods distributor operating across Indian markets required visibility into revenue performance, declining profitability, and loss-making customers between 2018 and 2020. The goal was to enable business leaders to make **data-driven decisions** around pricing, customer strategy, and regional focus.

This analysis helped identify **profit inefficiencies** not apparent from revenue-only reporting.

---

## Project Objective
Analyze revenue trends, city- and zone-level profitability, and customer contributions to identify growth opportunities, margin gaps, and underperforming markets. Present insights through **validated, executive-ready dashboards** to guide strategic decision-making.

---

## Dashboard Preview
A visual overview of sales, profitability, and customer performance:

[![Dashboard Preview](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page1(Key%20Insights).png)](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page1(Key%20Insights).png)

**Dashboard Pages (click to view full-size images):**
- [Executive Sales Overview](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page1(Key%20Insights).png) – revenue, sales quantity, market contribution, trend analysis  
- [Profitability & Margin Analysis](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page2(ProfitcAnalysis).png) – profit contribution, margin %, loss-making markets/customers  
- [Customer & Market Performance](https://github.com/NagashreeHegde/Dashboards/blob/main/Sales_Insights_Dashboard/Images/Dashboard_Page3(Performance%20Insights).png) – customer profitability, YoY trends, performance comparison  

---

## Key Metrics at a Glance
| Metric | Value |
|--------|-------|
| Total Revenue | ₹142M |
| Total Sales Quantity | 350K units |
| Top City by Revenue | Delhi |
| Top City by Profit Margin | Bhubaneshwar |
| Highest Profit-Contributing Customer | ElectricalSara Stores |

---

## Project Overview
- **Data Period:** Jan 2018 – Jun 2020  
- **Scope:** Multi-year sales, profit, and customer performance analysis  
- **Intended Users:**
  - Sales Leadership
  - Regional and City Managers
  - Finance and Profitability Teams
- **Tools Used:** Power BI, MySQL, Power Query, DAX  

---

## End-to-End Workflow

### Data Loading
Imported multiple sales-related tables from a MySQL database into Power BI.

### Data Transformation (ETL)
Cleaned and standardized data using Power Query, including:
- Schema correction  
- Currency normalization  
- Data consistency checks  

### Data Modeling
Designed a **star-schema** model with relationships between:
- `sales_customers`  
- `sales_products`  
- `sales_date`  
- `sales_markets`  
- `sales_transactions`  

### DAX Calculations
Created business-critical measures:
- Revenue  
- Sales Quantity  
- Profit Margin  
- Profit Margin Percentage  
- Revenue Contribution %  
- Revenue (Last Year) for YoY comparison  

### Visualization & Validation
Dashboards were built for **city-wise, market-wise, and customer-wise performance**. All KPIs and aggregates were **cross-validated against MySQL queries** to ensure accuracy.

---

## Key Business Insights

### Overall Sales Performance
- **Total Revenue:** ₹142M  
- **Total Sales Quantity:** 350K units  

### Market & City Insights
- **Delhi** generated the highest revenue and sales volume in 2020.  
- **Bhubaneshwar** achieved the highest profit margin percentage, showing potential for product expansion or targeted discount strategies.  
- **Mumbai** contributed 24% of total profit in 2020, emerging as the most profitable market.  
- **Central Zone** led in overall profit margin percentage.  
- **Bengaluru** recorded an average profit margin of **-21%** in 2020, highlighting significant inefficiencies.  

### Customer Profitability
- **ElectricalSara Stores:** 38% of total profit despite low margin (0.4%), driven by high-volume sales and loyalty.  
- **ElectricalLance Stores:** negative margin (-2%) and profit contribution (-0.15%).  
- **ElectricalQuipo Stores (2020):** -11.49% profit margin, -5% profit contribution — an unsustainable relationship.  

### Time-Based Sales Trends
- Revenue declined significantly during 2020 following COVID-related disruptions.  
- Jan–Jun 2020 revenue consistently underperformed compared to the same period in 2019.  

### Market Profitability Deep Dive
- **Leaders customer segment** showed the highest average profit margin.  
- **Surat**, historically profitable, experienced an **80% drop in profit margin** in 2020 (from ~5% to 1%), indicating pricing, cost, or volume challenges.  

---

## Strategic Recommendations

1. **Review loss-making customers**  
   Reassess pricing and contract terms for consistently unprofitable clients such as ElectricalLance Stores, Electricalsbae Stores, and ElectricalQuipo Stores.  

2. **Leverage high-margin zones**  
   Focus sales and investments in high-performing zones like the Central Zone and cities such as Bhubaneshwar and Delhi.  

3. **Nurture loyal, high-volume clients**  
   Strengthen engagement with key contributors like ElectricalSara Stores via loyalty programs, volume-based incentives, or exclusive offerings.  

4. **Address post-COVID revenue decline**  
   Implement targeted recovery strategies such as promotions, flexible pricing, or product bundling.  

5. **Investigate Bengaluru performance**  
   Conduct a detailed cost, pricing, and supply-chain analysis to identify root causes behind the -21% profit margin.  

---

## Contact
- **LinkedIn:** [Nagashree Hegde](https://linkedin.com/in/nagashree-hegde)
