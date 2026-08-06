# Retail Business Analytics — SQL, Python & Power BI

An end-to-end business analytics project on Maven Market's retail operations, combining **SQL Server** for data consolidation and querying, **Python** for statistical analysis and exploratory visualization, and **Power BI** for interactive executive dashboards. The project transforms two years (1997–1998) of raw transactional data into actionable business insights across sales, profitability, customers, products, stores, and returns.

## Objective

To build a complete analytics workflow — from raw retail transaction data to executive-ready insight — that supports data-driven decision-making across the key operational areas of a multi-region grocery retail business.

## Project Workflow

```
Raw CSV Data (Transactions, Products, Customers, Stores, Regions, Calendar, Returns)
        ↓
Data Cleaning & Validation
        ↓
SQL Database & Master Dataset
        ↓
Business Queries (SQL)
        ↓
Statistical Analysis (Python)
        ↓
Exploratory Visualization
        ↓
Power BI Dashboard Layer
        ↓
Business Insights & Recommendations
```

## Dataset

The analysis is built on Maven Market's retail dataset, covering:

| Dataset | Description |
|---|---|
| Transactions (1997 & 1998) | ~269,720 combined transaction line items |
| Products | ~1,560 products across 111 brands |
| Customers | ~10,281 registered customers |
| Stores | 24 stores across USA, Mexico, and Canada |
| Regions | Sales regions mapped to store locations |
| Calendar | Date dimension for time-based analysis |
| Returns | ~7,087 return records |

## Part 1 — SQL Analysis (MS SQL Server)

SQL Server was used to consolidate the raw yearly transaction files into unified views and to answer core business questions through structured querying.

**What was built:**
- Consolidated `Transactions`, `Sales_View`, `Customer_Sales_View`, `Store_Sales_View`, and `Returns_View` combining all source tables
- Executive KPI queries: total revenue, profit, orders, customers, products sold, average order value, profit margin, store and brand counts
- Business-question-driven queries covering sales trends, top/bottom products and stores, customer rankings, regional performance, and returns analysis
- Advanced SQL using window functions (`RANK()`, `ROW_NUMBER()`), Pareto (80/20) analysis, and moving averages

**Key business questions answered:**
- How is the business performing from a sales perspective?
- Which products and brands drive sales and profitability?
- Who are our customers, and how do different segments contribute to the business?
- Which stores and regions are driving performance, and which need attention?
- What products are being returned, and what is their business impact?
- What patterns can be discovered using advanced SQL (ranking, cumulative trends, moving averages)?

## Part 2 — Python Analysis (Pandas, Matplotlib, Seaborn, Plotly)

Python was used to validate the SQL findings, explore the data statistically, and generate business-focused visualizations.

**What was built:**
- Data ingestion and merging of all seven source tables into a single master dataset (269,720 rows × 49 columns)
- Derived fields: `Sales` (quantity × retail price) and `Profit` ((retail price − cost) × quantity)
- Monthly and interactive (Plotly) sales trend analysis
- Top 10 products, stores, and brands by revenue
- Revenue-by-region analysis and profit distribution
- Pareto (80/20) revenue concentration analysis
- High-revenue vs. low-margin product analysis
- Region and store performance matrices (Revenue vs. Profit)
- Customer segmentation (Bronze / Silver / Gold tiers by revenue)
- Returns analysis by product

## Part 3 — Power BI Dashboards

The SQL and Python findings were translated into six interactive Power BI dashboards for ongoing executive use.

1. **Sales Analysis**
   ![](https://github.com/yashr2812/Maven-Market-Analysis/blob/main/images/mavend_page-0001.jpg)
2. **Orders Overview**
   ![](https://github.com/yashr2812/Maven-Market-Analysis/blob/main/images/mavend_page-0002.jpg)
3. **Profit Analysis**
   ![](https://github.com/yashr2812/Maven-Market-Analysis/blob/main/images/mavend_page-0003.jpg)
4. **Returns Analysis**
   ![](https://github.com/yashr2812/Maven-Market-Analysis/blob/main/images/mavend_page-0004.jpg)
5. **Customer Insights**
   ![](https://github.com/yashr2812/Maven-Market-Analysis/blob/main/images/mavend_page-0005.jpg)
6. **Store Performance**
   ![](https://github.com/yashr2812/Maven-Market-Analysis/blob/main/images/mavend_page-0006.jpg)

## Key Business Insights

- Total revenue grew from ~$565K (1997) to ~$1.2M (1998), with Q4 consistently the strongest quarter both years
- Overall profit margin held stable at ~59.7%, with cost-to-revenue ratio consistent month to month
- Revenue and profitability are broadly distributed across the product catalog rather than concentrated in a few top sellers
- The North West region generates nearly half of total company revenue — a concentration worth diversifying
- Store 13 and Store 17 significantly outperform the rest of the 24-store network
- Customer value is broad-based and frequency-driven; most customers fall into the lowest revenue tier
- A small set of products carry return rates above 60% of units sold, flagging likely quality or fulfillment issues

## Key Features

- Clean, structured, multi-table data model joined across transactions, products, customers, stores, regions, and returns
- SQL views and business queries designed around real executive questions
- Python-based statistical validation, Pareto analysis, and segmentation
- Dynamic DAX measures and calculated columns in Power BI
- Timeline and trend-based visualizations across both fiscal years
- Slicers and filters (e.g., customer country) for interactive exploration
- A full business intelligence consulting report translating findings into executive recommendations

## Tools & Technologies Used

- **Microsoft SQL Server** – Data consolidation, views, and business querying
- **Python** (Pandas, NumPy, Matplotlib, Seaborn, Plotly) – Statistical analysis and visualization
- **Power BI Desktop** – Dashboard design and data modeling
- **DAX** – Custom calculations and filtering logic
- **Excel/CSV** – Source data preparation and initial exploration
- **Git/GitHub** – Version control and project collaboration

## Repository Structure

```
├── data/                  # Source CSV files (Transactions, Products, Customers, Stores, Regions, Calendar, Returns)
├── sql/                   # SQL scripts — views, KPI queries, business analysis queries
├── python/                # Jupyter notebook / analysis.ipynb — data prep, EDA, business analytics
├── powerbi/               # .pbix Power BI dashboard file
├── report/                # Full business analytics consulting report
├── images/                # Dashboard screenshots used in this README
└── README.md
```

## How to Use

1. Clone or download this repository.
2. **SQL:** Restore the source CSVs into SQL Server and run the scripts in `sql/` to build the views and run the KPI/business queries.
3. **Python:** Open the notebook in `python/` and run the cells to reproduce the data merge, KPIs, and visualizations.
4. **Power BI:** Open the `.pbix` file in Power BI Desktop and use the slicers and visuals to explore the six core dashboard areas.
5. Refer to the `report/` folder for the full written business analysis and executive recommendations.
6. Focus on 1997–1998 insights to identify trends, seasonality, and performance patterns across the business.

## Author

**Yash Raut**
