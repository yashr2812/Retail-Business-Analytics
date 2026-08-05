--Who are our customers, and how do different customer segments contribute to the business?

--Top 10 Customers by Revenue
SELECT TOP 10
    customer_id,
    first_name,
    last_name,
    SUM(Sales) AS Total_Revenue
FROM Customer_Sales_View
GROUP BY
    customer_id,
    first_name,
    last_name
ORDER BY Total_Revenue DESC;

--Top 10 Customers by Profit
SELECT TOP 10
    customer_id,
    first_name,
    last_name,
    SUM(Profit) AS Total_Profit
FROM Customer_Sales_View
GROUP BY
    customer_id,
    first_name,
    last_name
ORDER BY Total_Profit DESC;

--Revenue by Gender
SELECT
    gender,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY gender
ORDER BY Revenue DESC;

--Profit by Gender
SELECT
    gender,
    SUM(Profit) AS Profit
FROM Customer_Sales_View
GROUP BY gender
ORDER BY Profit DESC;

--Revenue by Marital Status
SELECT
    marital_status,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY marital_status
ORDER BY Revenue DESC;

--Revenue by Education Level
SELECT
    education,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY education
ORDER BY Revenue DESC;

--Revenue by Occupation
SELECT
    occupation,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY occupation
ORDER BY Revenue DESC;

--Revenue by Member Card Type
SELECT
    member_card,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY member_card
ORDER BY Revenue DESC;

--. Revenue by Income Group
SELECT
    yearly_income,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY yearly_income
ORDER BY Revenue DESC;

--Revenue by Customer Country
SELECT
    customer_country,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY customer_country
ORDER BY Revenue DESC;

--Revenue by Customer State
SELECT
    customer_state_province,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY customer_state_province
ORDER BY Revenue DESC;

--Revenue by Customer City
SELECT
    customer_city,
    SUM(Sales) AS Revenue
FROM Customer_Sales_View
GROUP BY customer_city
ORDER BY Revenue DESC;