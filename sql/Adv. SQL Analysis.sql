--What patterns can we discover using advanced SQL?

--Rank Products by Revenue

SELECT
    product_name,
    SUM(Sales) AS Revenue,
    RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Product_Rank
FROM Sales_View
GROUP BY product_name;

--Row Number for Customers
SELECT
    customer_id,
    first_name,
    SUM(Sales) AS Revenue,

    ROW_NUMBER() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS Customer_No
FROM Customer_Sales_View
GROUP BY
customer_id,
first_name;

--Top 3 Products in Each Brand 
WITH BrandRanking AS
(
    SELECT
        product_brand,
        product_name,
        SUM(Sales) AS Revenue,
        RANK() OVER
        (
            PARTITION BY product_brand
            ORDER BY SUM(Sales) DESC
        ) AS Brand_Rank
    FROM Sales_View
    GROUP BY
        product_brand,
        product_name
)

SELECT
    product_brand,
    product_name,
    Revenue,
    Brand_Rank
FROM BrandRanking
WHERE Brand_Rank <= 3
ORDER BY
    product_brand,
    Brand_Rank;

--Best Store in Every Region
WITH StoreRanking AS
(
    SELECT
        sales_region,
        store_name,
        SUM(Sales) AS Revenue,
        RANK() OVER
        (  PARTITION BY sales_region
            ORDER BY SUM(Sales) DESC
        ) AS Store_Rank
    FROM Store_Sales_View
    GROUP BY
        sales_region,
        store_name
)
SELECT
    sales_region,
    store_name,
    Revenue,
    Store_Rank
FROM StoreRanking
WHERE Store_Rank = 1
ORDER BY sales_region;

--Month-over-Month Sales Growth
WITH MonthlySales AS
(
    SELECT
        YEAR(transaction_date) AS Sales_Year,
        MONTH(transaction_date) AS Sales_Month,
        SUM(Sales) AS Revenue

    FROM Sales_View

    GROUP BY
        YEAR(transaction_date),
        MONTH(transaction_date)
)

SELECT
    Sales_Year,
    Sales_Month,
    Revenue,
    LAG(Revenue) OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Previous_Month_Revenue,
    Revenue -
    LAG(Revenue) OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Revenue_Growth
FROM MonthlySales
ORDER BY
    Sales_Year,
    Sales_Month;

--Month-over-Month Profit Growth
WITH MonthlyProfit AS
(
    SELECT
        YEAR(transaction_date) AS Sales_Year,
        MONTH(transaction_date) AS Sales_Month,
        SUM(Profit) AS Profit

    FROM Sales_View

    GROUP BY
        YEAR(transaction_date),
        MONTH(transaction_date)
)

SELECT
    Sales_Year,
    Sales_Month,
    Profit,
    LAG(Profit) OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Previous_Month_Profit,
    Profit -
    LAG(Profit) OVER
    (
        ORDER BY Sales_Year, Sales_Month
    ) AS Profit_Growth

FROM MonthlyProfit
ORDER BY
    Sales_Year,
    Sales_Month;

--Running Revenue
SELECT
    transaction_date,
    SUM(Sales) AS Daily_Revenue,
    SUM(SUM(Sales)) OVER
    (
        ORDER BY transaction_date
    ) AS Running_Revenue
FROM Sales_View
GROUP BY transaction_date
ORDER BY transaction_date;

--Running Profit
SELECT
    transaction_date,
    SUM(Profit) AS Daily_Profit,
    SUM(SUM(Profit)) OVER
    (   ORDER BY transaction_date
    ) AS Running_Profit
FROM Sales_View
GROUP BY transaction_date
ORDER BY transaction_date;

--Pareto Analysis (80/20 Rule)
WITH ProductRevenue AS
(    SELECT
        product_name,
        SUM(Sales) AS Revenue
    FROM Sales_View
    GROUP BY product_name
),

ParetoAnalysis AS
(    SELECT
        product_name,
        Revenue,
        SUM(Revenue) OVER
        (      ORDER BY Revenue DESC
        ) AS Cumulative_Revenue,
        SUM(Revenue) OVER() AS Total_Revenue
    FROM ProductRevenue
)

SELECT
    product_name,
    Revenue,
    Cumulative_Revenue,
    ROUND
    (
        (Cumulative_Revenue * 100.0) / Total_Revenue,
        2
    ) AS Cumulative_Revenue_Percentage
FROM ParetoAnalysis
ORDER BY Revenue DESC;

--3-Month Moving Average Revenue
WITH MonthlyRevenue AS
(
    SELECT
        YEAR(transaction_date) AS Sales_Year,
        MONTH(transaction_date) AS Sales_Month,
        SUM(Sales) AS Revenue
    FROM Sales_View
    GROUP BY
        YEAR(transaction_date),
        MONTH(transaction_date)
)

SELECT
    Sales_Year,
    Sales_Month,
    Revenue,
    AVG(Revenue) OVER
    (
        ORDER BY Sales_Year, Sales_Month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS Moving_Average_3_Months
FROM MonthlyRevenue
ORDER BY
    Sales_Year,
    Sales_Month;


--Most Profitable Product in Every Brand
WITH ProductRanking AS
(
    SELECT
        product_brand,
        product_name,
        SUM(Profit) AS Total_Profit,
        RANK() OVER
        (
            PARTITION BY product_brand
            ORDER BY SUM(Profit) DESC
        ) AS Product_Rank
    FROM Sales_View
    GROUP BY
        product_brand,
        product_name
)
SELECT
    product_brand,
    product_name,
    Total_Profit
FROM ProductRanking
WHERE Product_Rank = 1
ORDER BY product_brand;

