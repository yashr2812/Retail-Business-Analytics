CREATE VIEW Transactions AS

SELECT *
FROM Transactions_1997

UNION ALL

SELECT *
FROM Transactions_1998;




CREATE VIEW Sales_View AS

SELECT

t.transaction_date,
t.stock_date,

t.customer_id,
t.product_id,
t.store_id,

p.product_name,
p.product_brand,
p.product_sku,

p.product_cost,
p.product_retail_price,

t.quantity,

(t.quantity * p.product_retail_price) AS Sales,

(t.quantity * p.product_cost) AS Cost,

((t.quantity * p.product_retail_price) -
 (t.quantity * p.product_cost)) AS Profit,

ROUND(
(
((t.quantity * p.product_retail_price) -
 (t.quantity * p.product_cost))
/
NULLIF((t.quantity * p.product_retail_price),0)
)*100
,2) AS Profit_Margin

FROM Transactions t

JOIN Products p
ON t.product_id = p.product_id;



CREATE VIEW Customer_Sales_View AS

SELECT

sv.*,

c.first_name,
c.last_name,

c.gender,
c.marital_status,
c.education,

c.occupation,
c.member_card,

c.yearly_income,

c.customer_city,
c.customer_state_province,
c.customer_country

FROM Sales_View sv

JOIN Customers c

ON sv.customer_id = c.customer_id;


CREATE VIEW Store_Sales_View AS

SELECT

sv.*,

s.store_name,
s.store_type,

s.store_city,
s.store_state,
s.store_country,

r.sales_region,
r.sales_district

FROM Sales_View sv

JOIN Stores s

ON sv.store_id = s.store_id

JOIN Regions r

ON s.region_id = r.region_id;
GO



CREATE VIEW Returns_View AS

SELECT

r.return_date,

r.product_id,

p.product_name,
p.product_brand,

r.quantity AS Returned_Quantity,

p.product_cost,
p.product_retail_price,

(r.quantity * p.product_cost) AS Return_Cost,

(r.quantity * p.product_retail_price) AS Return_Value

FROM Returns r

JOIN Products p

ON r.product_id = p.product_id;
GO


CREATE VIEW Customer_Store_Sales_View AS

SELECT

sv.transaction_date,

sv.stock_date,

sv.customer_id,

c.first_name,
c.last_name,

c.gender,
c.education,
c.member_card,

sv.store_id,

s.store_name,
s.store_city,

r.sales_region,

sv.product_id,

sv.product_name,
sv.product_brand,

sv.quantity,

sv.Sales,
sv.Cost,
sv.Profit,
sv.Profit_Margin

FROM Sales_View sv

JOIN Customers c

ON sv.customer_id = c.customer_id

JOIN Stores s

ON sv.store_id = s.store_id

JOIN Regions r

ON s.region_id = r.region_id;
GO

