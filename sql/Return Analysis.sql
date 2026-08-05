--What products are being returned, where are returns happening, and what is their business impact?

--Total Returned Quantity
SELECT
    SUM(Returned_Quantity) AS Total_Returned_Units
FROM Returns_View;

--Top 10 Most Returned Products
SELECT TOP 10
    product_name,
    SUM(Returned_Quantity) AS Total_Returns
FROM Returns_View
GROUP BY product_name
ORDER BY Total_Returns DESC;

--Top Brands by Returned Quantity
SELECT
    product_brand,
    SUM(Returned_Quantity) AS Total_Returns
FROM Returns_View
GROUP BY product_brand
ORDER BY Total_Returns DESC;

--Return Value by Product
SELECT
    product_name,
    SUM(Return_Value) AS Total_Return_Value
FROM Returns_View
GROUP BY product_name
ORDER BY Total_Return_Value DESC;

--Return Cost by Product
SELECT
    product_name,
    SUM(Return_Cost) AS Total_Return_Cost
FROM Returns_View
GROUP BY product_name
ORDER BY Total_Return_Cost DESC;

--Return Value by Brand
SELECT
    product_brand,
    SUM(Return_Value) AS Total_Return_Value
FROM Returns_View
GROUP BY product_brand
ORDER BY Total_Return_Value DESC;

--Average Return Quantity per Product
SELECT
    product_name,
    ROUND(AVG(Returned_Quantity),2) AS Avg_Return_Qty
FROM Returns_View
GROUP BY product_name
ORDER BY Avg_Return_Qty DESC;

--Return Quantity by Month
SELECT
    YEAR(return_date) AS Return_Year,
    MONTH(return_date) AS Return_Month,
    SUM(Returned_Quantity) AS Total_Returns
FROM Returns_View
GROUP BY
    YEAR(return_date),
    MONTH(return_date)
ORDER BY
    Return_Year,
    Return_Month;

--Products with No Returns
SELECT
    p.product_name
FROM Products p
LEFT JOIN Returns r
ON p.product_id = r.product_id
WHERE r.product_id IS NULL;

--Return Percentage by Product
SELECT
    rv.product_name,
    SUM(rv.Returned_Quantity) AS Returned_Qty,
    SUM(sv.quantity) AS Sold_Qty,
    ROUND(
        (SUM(rv.Returned_Quantity) * 100.0) /
        NULLIF(SUM(sv.quantity),0),
        2
    ) AS Return_Percentage
FROM Returns_View rv
JOIN Sales_View sv
ON rv.product_id = sv.product_id
GROUP BY rv.product_name
ORDER BY Return_Percentage DESC;