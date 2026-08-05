--How is the business performing from a sales perspective?

--Total Sales by Year
SELECT
    YEAR(transaction_date) AS Sales_Year,
    SUM(Sales) AS Total_Sales
FROM Sales_View
GROUP BY YEAR(transaction_date)
ORDER BY Sales_Year;

--Monthly Sales Trend
SELECT
    YEAR(transaction_date) AS Year,
    MONTH(transaction_date) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM Sales_View
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date)
ORDER BY
    Year,
    Month;

--Top 10 Best-Selling Products (Revenue)
SELECT TOP 10
    product_name,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY product_name
ORDER BY Revenue DESC;

--Bottom 10 Products by Revenue
SELECT TOP 10
    product_name,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY product_name
ORDER BY Revenue ASC;

--Top Brands by Revenue
SELECT
    product_brand,
    SUM(Sales) AS Revenue
FROM Sales_View
GROUP BY product_brand
ORDER BY Revenue DESC;

--Revenue by Store
SELECT
    store_name,
    SUM(Sales) AS Revenue
FROM Store_Sales_View
GROUP BY store_name
ORDER BY Revenue DESC;

--Revenue by Region
SELECT
    sales_region,
    SUM(Sales) AS Revenue
FROM Store_Sales_View
GROUP BY sales_region
ORDER BY Revenue DESC;

--Revenue by Store Type
SELECT
    store_type,
    SUM(Sales) AS Revenue
FROM Store_Sales_View
GROUP BY store_type
ORDER BY Revenue DESC;

--Revenue by Country
SELECT
    store_country,
    SUM(Sales) AS Revenue
FROM Store_Sales_View
GROUP BY store_country
ORDER BY Revenue DESC;

--Revenue by City
SELECT
    store_city,
    SUM(Sales) AS Revenue
FROM Store_Sales_View
GROUP BY store_city
ORDER BY Revenue DESC;

--Quantity Sold by Product
SELECT
    product_name,
    SUM(quantity) AS Total_Units_Sold
FROM Sales_View
GROUP BY product_name
ORDER BY Total_Units_Sold DESC;

--Average Sales per Product
SELECT
    product_name,
    ROUND(AVG(Sales),2) AS Average_Sale
FROM Sales_View
GROUP BY product_name
ORDER BY Average_Sale DESC;

--Average Selling Price
SELECT
    ROUND(AVG(product_retail_price),2) AS Average_Selling_Price
FROM Products;

--Daily Sales Trend
SELECT
    transaction_date,
    SUM(Sales) AS Daily_Sales
FROM Sales_View
GROUP BY transaction_date
ORDER BY transaction_date

--Revenue Contribution of Each Brand
SELECT
    product_brand,
    SUM(Sales) AS Revenue,
    ROUND(
        SUM(Sales) * 100.0 /
        (SELECT SUM(Sales) FROM Sales_View),
        2
    ) AS Revenue_Percentage
FROM Sales_View
GROUP BY product_brand
ORDER BY Revenue DESC;