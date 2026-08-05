--Which stores and regions are driving business performance, and which ones need attention?

--Top 10 Stores by Revenue
SELECT TOP 10
    store_name,
    SUM(Sales) AS Total_Revenue
FROM Store_Sales_View
GROUP BY store_name
ORDER BY Total_Revenue DESC;

--Bottom 10 Stores by Revenue
SELECT TOP 10
    store_name,
    SUM(Sales) AS Total_Revenue
FROM Store_Sales_View
GROUP BY store_name
ORDER BY Total_Revenue ASC;

--Top Stores by Profit
SELECT
    store_name,
    SUM(Profit) AS Total_Profit
FROM Store_Sales_View
GROUP BY store_name
ORDER BY Total_Profit DESC;

--Revenue by Store Type
SELECT
    store_type,
    SUM(Sales) AS Total_Revenue
FROM Store_Sales_View
GROUP BY store_type
ORDER BY Total_Revenue DESC;

--Profit by Store Type
SELECT
    store_type,
    SUM(Profit) AS Total_Profit
FROM Store_Sales_View
GROUP BY store_type
ORDER BY Total_Profit DESC;

--Revenue by Region
SELECT
    sales_region,
    SUM(Sales) AS Total_Revenue
FROM Store_Sales_View
GROUP BY sales_region
ORDER BY Total_Revenue DESC;

--Profit by Region
SELECT
    sales_region,
    SUM(Profit) AS Total_Profit
FROM Store_Sales_View
GROUP BY sales_region
ORDER BY Total_Profit DESC;

--Revenue by Sales District
SELECT
    sales_district,
    SUM(Sales) AS Total_Revenue
FROM Store_Sales_View
GROUP BY sales_district
ORDER BY Total_Revenue DESC;

--Revenue by Store Country
SELECT
    store_country,
    SUM(Sales) AS Total_Revenue
FROM Store_Sales_View
GROUP BY store_country
ORDER BY Total_Revenue DESC;

--Revenue by Store City
SELECT
    store_city,
    SUM(Sales) AS Total_Revenue
FROM Store_Sales_View
GROUP BY store_city
ORDER BY Total_Revenue DESC;

--Average Revenue per Store
SELECT
    store_name,
    ROUND(AVG(Sales),2) AS Average_Revenue
FROM Store_Sales_View
GROUP BY store_name
ORDER BY Average_Revenue DESC;

--Average Profit per Store
SELECT
    store_name,
    ROUND(AVG(Profit),2) AS Average_Profit
FROM Store_Sales_View
GROUP BY store_name
ORDER BY Average_Profit DESC;