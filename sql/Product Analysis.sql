--Which products and brands drive sales and profitability?

--Top 10 Products by Revenue
SELECT TOP 10
    product_name,
    SUM(Sales) AS Total_Revenue
FROM Sales_View
GROUP BY product_name
ORDER BY Total_Revenue DESC;

--Bottom 10 Products by Revenue
SELECT TOP 10
    product_name,
    SUM(Sales) AS Total_Revenue
FROM Sales_View
GROUP BY product_name
ORDER BY Total_Revenue ASC;

--Top 10 Products by Profit
SELECT TOP 10
    product_name,
    SUM(Profit) AS Total_Profit
FROM Sales_View
GROUP BY product_name
ORDER BY Total_Profit DESC;

--Top Brands by Revenue
SELECT
    product_brand,
    SUM(Sales) AS Total_Revenue
FROM Sales_View
GROUP BY product_brand
ORDER BY Total_Revenue DESC;

--Top Brands by Profit
SELECT
    product_brand,
    SUM(Profit) AS Total_Profit
FROM Sales_View
GROUP BY product_brand
ORDER BY Total_Profit DESC;

--Most Sold Products
SELECT
    product_name,
    SUM(quantity) AS Units_Sold
FROM Sales_View
GROUP BY product_name
ORDER BY Units_Sold DESC;

--Average Selling Price by Brand
SELECT
    product_brand,
    ROUND(AVG(product_retail_price),2) AS Avg_Selling_Price
FROM Products
GROUP BY product_brand
ORDER BY Avg_Selling_Price DESC;

--Average Product Cost by Brand
SELECT
    product_brand,
    ROUND(AVG(product_cost),2) AS Avg_Product_Cost
FROM Products
GROUP BY product_brand
ORDER BY Avg_Product_Cost DESC;

--Revenue by Recyclable Products
SELECT
    recyclable,
    SUM(Sales) AS Total_Revenue
FROM Sales_View
JOIN Products
ON Sales_View.product_id = Products.product_id
GROUP BY recyclable;

--Revenue by Low Fat Products
SELECT
    low_fat,
    SUM(Sales) AS Total_Revenue
FROM Sales_View
JOIN Products
ON Sales_View.product_id = Products.product_id
GROUP BY low_fat;

--Product-wise Profit Margin
SELECT
    product_name,
    ROUND(
        (SUM(Profit) * 100.0) / SUM(Sales),
        2
    ) AS Profit_Margin
FROM Sales_View
GROUP BY product_name
ORDER BY Profit_Margin DESC;

--Product SKU Performance
SELECT
    product_sku,
    SUM(Sales) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM Sales_View
GROUP BY product_sku
ORDER BY Total_Revenue DESC;