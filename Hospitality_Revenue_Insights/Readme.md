# Hospitality Revenue Analysis – AtliQ Grand Hotels

**Tools:** Power BI · Power Query · DAX  
**Data:** Booking-level hotel data · May – July 2022 · ₹1.7B total revenue  
**Repo:** [Dashboards/Hospitality_Revenue_Insights](https://github.com/NagashreeHegde/Dashboards/tree/main/Hospitality_Revenue_Insights)

---

## The Business Problem

AtliQ Grand operates hotels across 4 cities — Mumbai, Delhi, Bangalore, and Hyderabad. Total revenue over the 3-month period was ₹1.7B, with an average occupancy of 57.8%.

The core problem: **revenue and occupancy numbers look acceptable at the surface, but pricing is flat across all platforms and day types.** The business is not adjusting rates based on demand — which means it is leaving revenue on the table during high-occupancy periods and failing to stimulate bookings during low-demand windows.

This project analyses booking and revenue data to identify where pricing, occupancy, and channel strategy can be improved.

---

## Business Questions

- Which cities and properties are driving revenue vs. occupancy — and is there a gap?
- Is the business capturing the demand difference between weekdays and weekends in its pricing?
- Which booking platforms perform best on ADR and realization %?
- Which properties have low ratings, high cancellations, and what is the revenue impact?
- Are direct bookings being incentivised — and should they be?

---

## Data Overview

| Detail | Value |
|--------|-------|
| Period | May 1 – July 31, 2022 |
| Granularity | Booking-level |
| Source | Excel files (CSV format) |
| Cities | Mumbai · Delhi · Bangalore · Hyderabad |

**Tables:**
- `fact_bookings` — transaction-level booking records
- `fact_aggregated_bookings` — property-level aggregated capacity and bookings
- `dim_hotels` — property and city details
- `dim_rooms` — room category details
- `dim_date` — date, week, and day type

**Data Model – Star Schema**

![Data Model](Images/Data_Model.png)

---

## Key Metrics

| Metric | Value |
|--------|-------|
| Total Revenue | ₹1.7B |
| Overall Occupancy % | 57.8% |
| Average ADR | ₹12,696 |
| RevPAR | ₹7,337 |
| Realization % | 80.2% |
| Average Rating | 3.62 / 5 |
| Cancellation Rate | 24.8% |

---

## Dashboard

**Page 1 – Booking & Occupancy Insights**

![Booking and Occupancy Insights](Images/Booking%20%26%20Occupancy%20Insights.png)

Revenue by city, occupancy % by city, booking platform distribution, and weekday vs. weekend breakdown.

---

**Page 2 – Property Performance**

![Property Performance](Images/Property%20Performance%20Dashboard.png)

Property-level table with revenue, occupancy %, ADR, cancellation %, realization %, and average rating. Room class and city booking distribution.

---

**Page 3 – Pricing & KPI Trend Analysis**

![KPI Trend Analysis](Images/Level1%20Analysis.png)

Weekly trends in RevPAR, ADR, and occupancy %. ADR and realization % by booking platform. Identifies pricing behaviour and demand patterns over time.

---

## Key Findings

**Revenue vs. Occupancy gap across cities**

Mumbai leads in revenue at ₹669M but ranks third in occupancy at 57.9%. Delhi has the highest occupancy at 60.5% but contributes only ₹295M in revenue — the lowest of the four cities. This suggests Delhi's ADR is not keeping pace with its demand level.

**Flat ADR across platforms and day types**

ADR is consistent across all booking platforms and shows no meaningful difference between weekdays and weekends. Weekday revenue is ₹1.18B vs. weekend revenue of ₹524M, but occupancy on weekends (62.6%) is higher than weekdays (55.8%). The business is filling more rooms on weekends but not charging more for them.

**Direct bookings show no pricing advantage**

Direct offline and direct online channels have ADR comparable to third-party platforms, despite carrying no commission cost. There is no visible incentive structure driving guests toward direct channels.

**Property-level performance gap**

AtliQ Exotica Mumbai generates the highest revenue at ₹118M with 65.9% occupancy and a 4.32 rating. AtliQ Seasons Mumbai generates only ₹66M with 44.6% occupancy and a 2.29 rating — the lowest rated property, also with the highest revenue impact gap.

**Elite rooms dominate bookings**

Elite room class accounts for 36.8% of bookings, the highest share across all categories. Presidential rooms at 11.9% represent the smallest booking share — whether this reflects inventory constraints or demand patterns requires further investigation.

**Realization % declining from Week 25 onward**

Realization % drops consistently from ~82% in Week 19 to ~79% by Week 26, for both weekday and weekend segments. This signals increasing cancellations or no-shows in the later weeks of the period.

---

## Recommendations

- Introduce weekend pricing premiums where occupancy consistently exceeds 60% — current flat ADR means high-demand nights are priced the same as low-demand nights
- Review Delhi ADR relative to its occupancy performance — highest occupancy but lowest revenue city suggests underpricing
- Direct channels show no ADR advantage over third-party platforms — introducing direct-only benefits could shift the booking mix toward lower-commission channels, though commission data would be needed to quantify the impact
- Investigate AtliQ Seasons Mumbai — lowest rating (2.29), lowest occupancy (44.6%), and largest revenue gap relative to comparable properties
- Realization % declines consistently from Week 25 onward for both day types — the cause is not determinable from this dataset alone and would require cancellation and booking lead time data to investigate further

---

## Limitations

This analysis covers a 3-month window (May–July 2022) only. The following are not available in the dataset:

- Cost data — no room-level or property-level cost structure, so margin analysis is not possible
- Historical data beyond 3 months — seasonal trends cannot be confirmed
- Pricing contract terms by platform — ADR comparisons reflect realized rates, not listed prices

Findings reflect booking and revenue patterns within this period only and should be validated against a longer time horizon before driving structural pricing decisions.

---

## Repository Structure

```
Hospitality_Revenue_Insights/
│
├── README.md
├── hospitality_revenue_Insights.pbix
├── Data/
│   ├── dim_date.csv
│   ├── dim_hotels.csv
│   ├── dim_rooms.csv
│   ├── fact_bookings.csv
│   ├── fact_aggregated_bookings.csv
│   ├── meta_data_hospitality.txt
│   └── metrics list.xlsx
└── Images/
    ├── Data_Model.png
    ├── Booking & Occupancy Insights.png
    ├── Property_Performance_Dashboard.png
    ├── Level1_Analysis.png
    └── KPI_tooltip_sample.png
```

---

## Tools

| Tool | Use |
|------|-----|
| Power BI Desktop | Dashboard development |
| Power Query | Data cleaning and transformation |
| DAX | KPI measure calculations |

---

## About

**Nagashree Hegde** – Data Analyst · SQL · Python · Power BI

[LinkedIn](https://www.linkedin.com/in/nagashree-hegde) · [GitHub](https://github.com/NagashreeHegde)

---

*All metrics are calculated from booking-level source data. KPIs follow standard hospitality definitions: RevPAR = Revenue per available room, ADR = Average daily rate, DSRN = Daily sellable room nights.*
