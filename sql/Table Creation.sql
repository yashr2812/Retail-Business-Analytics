CREATE TABLE Calendar(
    [Date] DATE PRIMARY KEY
);

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY,
    customer_acct_num BIGINT,
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    customer_address NVARCHAR(255),
    customer_city NVARCHAR(100),
    customer_state_province NVARCHAR(100),
    customer_postal_code NVARCHAR(20),
    customer_country NVARCHAR(100),
    birthdate DATE,
    marital_status NVARCHAR(20),
    yearly_income NVARCHAR(30),  
    gender NVARCHAR(10),
    total_children INT,
    num_children_at_home INT,
    education NVARCHAR(100),
    acct_open_date DATE,
    member_card NVARCHAR(30),
    occupation NVARCHAR(100),
    homeowner NVARCHAR(10)
);

CREATE TABLE Products(
    product_id INT PRIMARY KEY,
    product_brand NVARCHAR(100),
    product_name NVARCHAR(255),
    product_sku NVARCHAR(50),
    product_retail_price DECIMAL(10,2),
    product_cost DECIMAL(10,2),
    product_weight DECIMAL(10,2),
    recyclable NVARCHAR(10),
    low_fat NVARCHAR(10)
);

CREATE TABLE Regions(
    region_id INT PRIMARY KEY,
    sales_district NVARCHAR(100),
    sales_region NVARCHAR(100)
);

CREATE TABLE Stores(
    store_id INT PRIMARY KEY,
    region_id INT,
    store_type NVARCHAR(50),
    store_name NVARCHAR(100),
    store_street_address NVARCHAR(255),
    store_city NVARCHAR(100),
    store_state NVARCHAR(100),
    store_country NVARCHAR(100),
    store_phone NVARCHAR(30),
    first_opened_date DATE,
    last_remodel_date DATE,
    total_sqft INT,
    grocery_sqft INT
);

CREATE TABLE Transactions_1997(
    transaction_date DATE,
    stock_date DATE,
    product_id INT,
    customer_id INT,
    store_id INT,
    quantity INT
);

CREATE TABLE Transactions_1998(
    transaction_date DATE,
    stock_date DATE,
    product_id INT,
    customer_id INT,
    store_id INT,
    quantity INT
);

CREATE TABLE Returns(
    return_date DATE,
    product_id INT,
    store_id INT,
    quantity INT
);