# 📊 Sales Insights Report – Power BI Dashboard

An interactive Power BI dashboard designed to uncover deep sales insights from January 2018 to June 2020. The report analyzes revenue, sales quantity, profit margins, city-wise trends, market performance, and customer profitability. This project showcases advanced Power BI capabilities including MySQL integration, ETL using Power Query, DAX measures, and cross-validation using SQL.

---
## 📊 Dashboard Preview
![Image](https://github.com/user-attachments/assets/303fb131-38a4-4c12-8737-cdcf7c4051c8)

---

## 🧾 Project Overview

- **📅 Data Period:** Jan 2018 – Jun 2020  
- **📌 Objective:** Analyze revenue trends, zone/city-level profitability, and customer contributions to guide business growth.  
- **🛠 Tools Used:** Power BI, MySQL, Power Query, DAX

---

## 🔁 Workflow Steps

1. **📥 Data Loading**
   - Imported multiple sales-related tables from MySQL database into Power BI.

2. **⚙️ Data Transformation (ETL)**
   - Cleaned and prepared data using Power Query Editor.

3. **🔗 Data Modeling**
   - Created relationships between:
     - `sales_customers`
     - `sales_products`
     - `sales_date`
     - `sales_markets`
     - `sales_transactions`

4. **🧮 DAX Calculations**
   - Developed key measures:
     - Revenue
     - Sales Quantity
     - Profit Margin
     - Profit Margin %
     - Revenue Contribution %
     - Revenue Last Year

5. **📊 Visualizations**
   - Built visuals for city-wise, market-wise, and customer-wise performance.
   - Verified KPI results using MySQL queries to ensure accuracy.

---

## 💡 Key Insights from the Dashboard

### 📌 1. Overall Sales Performance
- **Total Revenue:** ₹142M  
- **Total Sales Quantity:** 350K units

---

### 🏙️ 2. City-Level Highlights
- In 2020, **Delhi** achieved the **highest revenue and sales**, but **Bhubaneshwar** led in **profit %**.
- **Bhubaneshwar** shows strong profitability – ideal for offering discounts or launching new products.

---

### 🌆 3. Market and Zone Trends
- **Delhi** remained the top profit-generating city over 3 years.
- In 2020, **Mumbai** contributed **24% of total profit**, becoming the most profitable market.
- **Central Zone** led in overall **profit margin %**, while **Bengaluru** reported a **-21% negative profit margin**.

---

### 🛍️ 4. Customer Profitability
- **ElectricalSara Stores** provided **38% of total profit**, even with just **0.4% profit margin**, proving high loyalty and volume.
- **ElectricalLance Stores** showed both **negative margin (-2%)** and **negative return (-0.15%)**.
- In 2020, **ElectricalQuipo Stores** had a **-11.49% profit margin** and **-5% profit contribution**, indicating unsustainable partnership.

---

### 📉 5. Time-Based Sales Trends
- **Revenue declined steadily from May 2020 to Jan 2020**, likely due to COVID impact.
- For **Jan to Jun 2020**, revenue consistently failed to exceed previous year’s performance.

---

### 🧠 6. Customer & Market Profit Margin analysis
- **Leaders Customer** category showed the **highest average profit margin %**.
- 📉 **Surat's Profitability Drop in 2020**
- **Surat**, historically one of the most profitable markets, saw a steep decline in profit margin in **2020**, dropping by **80%** compared to its average — from **5%** to just **1%**. This indicates a potential pricing, cost, or volume issue that warrants further investigation.

---

## 📌 Strategic Recommendations

1. **🛑 Review Loss-Making Customers**  
   Reassess pricing and terms for consistently loss-making customers such as **ElectricalLance Stores**, **Electricalsbae Stores**, and **ElectricalQuipo**, who show negative profit margins and contribute negatively to overall profit.

2. **💹 Leverage High-Margin Zones**  
   Allocate more resources to high-performing zones like the **Central Zone**, and cities like **Bhubaneshwar** and **Delhi**, which show strong profit margins and revenue growth potential.

3. **🤝 Nurture Loyal High-Volume Clients**  
   Strengthen relationships with top contributors like **ElectricalSara Stores**, who consistently provide high profit contributions despite operating on low margins. Consider loyalty programs or exclusive deals to retain and grow this segment.

4. **📉 Address Post-COVID Revenue Decline**  
   Implement targeted recovery strategies to mitigate the **May 2020 – Jan 2020 revenue decline**, such as promotional campaigns, flexible pricing, or bundling to re-engage customers.

5. **🔍 Deep Dive into Bengaluru Performance**  
   Investigate the reasons behind **-21% negative profit margin** in Bengaluru. Analyze cost structures, pricing, and supply chain inefficiencies to identify actionable fixes.

---

## 📬 Contact
Feel free to connect with me:
- [LinkedIn](https://linkedin.com/in/nagashree-hegde)
