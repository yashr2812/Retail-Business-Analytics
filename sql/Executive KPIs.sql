---Executive KPIs
/*
1. Total Revenue
2. Total Profit
3. Total Orders
4. Total Customers
5. Total Products Sold
6. Average Order Value
7. Average Profit per Order
8. Overall Profit Margin
9. Total Stores
10. Total Brands */

-- TOTal Revenue
SELECT (SUM(Sales)) AS Total_Revenue
FROM Sales_View; 

--Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM Sales_View;

--Total Orders
SELECT COUNT(*) AS Total_Orders
FROM Transactions;

--Total Customers
SELECT COUNT(DISTINCT customer_id) as Total_Customers
FROM Transactions;

--Total Products Sold
SELECT SUM(quantity) as Total_Products_Sold
FROM Transactions;

--Average Order Value (AOV)
SELECT
    ROUND(SUM(Sales) / COUNT(*), 2) AS Average_Order_Value
FROM Sales_View;

--Average Profit per Order
SELECT
    ROUND(SUM(Profit) / COUNT(*), 2) AS Average_Profit_Per_Order
FROM Sales_View;

--Overall Profit Margin
SELECT
    ROUND(
        (SUM(Profit) * 100.0) / SUM(Sales),
        2
    ) AS Profit_Margin_Percentage
FROM Sales_View;

--Total Distinct Stores
 SELECT
    COUNT(DISTINCT store_id) AS Total_Stores
FROM Transactions;

--Total Distinct Brands
SELECT
    COUNT(DISTINCT product_brand) AS Total_Brands
FROM Products;

--Revenue per Customer
SELECT
    ROUND(
        SUM(Sales) /
        COUNT(DISTINCT customer_id),
        2
    ) AS Revenue_Per_Customer
FROM Sales_View;

--Revenue per Store
SELECT
    ROUND(
        SUM(Sales) /
        COUNT(DISTINCT store_id),
        2
    ) AS Revenue_Per_Store
FROM Sales_View;