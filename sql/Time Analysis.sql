--How does the business perform over time?

--Sales by Year
SELECT
    YEAR(transaction_date) AS Sales_Year,
    SUM(Sales) AS Total_Revenue
FROM Sales_View
GROUP BY YEAR(transaction_date)
ORDER BY Sales_Year;

--Profit by Year
SELECT
    YEAR(transaction_date) AS Sales_Year,
    SUM(Profit) AS Total_Profit
FROM Sales_View
GROUP BY YEAR(transaction_date)
ORDER BY Sales_Year;

--Monthly Revenue Trend
SELECT
    YEAR(transaction_date) AS Year,
    MONTH(transaction_date) AS Month,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY
    Year,
    Month;

--Monthly Profit Trend
SELECT
    YEAR(transaction_date) AS Year,
    MONTH(transaction_date) AS Month,
    SUM(Profit) AS Profit
FROM Sales_View
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY
    Year,
    Month;

--Quarterly Sales
SELECT
    YEAR(transaction_date) AS Year,
    DATEPART(QUARTER, transaction_date) AS Quarter,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY
    YEAR(transaction_date),
    DATEPART(QUARTER, transaction_date)
ORDER BY
    Year,
    Quarter;

--Quarterly Profit
SELECT
    YEAR(transaction_date) AS Year,
    DATEPART(QUARTER, transaction_date) AS Quarter,
    SUM(Profit) AS Profit
FROM Sales_View
GROUP BY
    YEAR(transaction_date),
    DATEPART(QUARTER, transaction_date)
ORDER BY
    Year,
    Quarter;

--Daily Sales Trend
SELECT
    transaction_date,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY transaction_date
ORDER BY transaction_date;

--Day-wise Revenue
SELECT
    DATENAME(WEEKDAY, transaction_date) AS Weekday,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY DATENAME(WEEKDAY, transaction_date)
ORDER BY Revenue DESC;

--Monthly Order Count
SELECT
    YEAR(transaction_date) AS Year,
    MONTH(transaction_date) AS Month,
    COUNT(*) AS Total_Orders
FROM Sales_View
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY
    Year,
    Month;

--Monthly Units Sold
SELECT
    YEAR(transaction_date) AS Year,
    MONTH(transaction_date) AS Month,
    SUM(quantity) AS Units_Sold
FROM Sales_View
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY
    Year,
    Month;

--Average Daily Revenue
SELECT
    transaction_date,
    AVG(Sales) AS Average_Daily_Revenue
FROM Sales_View
GROUP BY transaction_date
ORDER BY transaction_date;

--Highest Revenue Day
SELECT TOP 1
    transaction_date,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY transaction_date
ORDER BY Revenue DESC;