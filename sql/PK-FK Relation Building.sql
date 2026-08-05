/*ADDING FOREIGN KEYS*/

ALTER TABLE Stores
ADD CONSTRAINT FK_Stores_Regions
FOREIGN KEY (region_id)
REFERENCES Regions(region_id);

ALTER TABLE Transactions_1997
ADD CONSTRAINT FK_Transactions97_Products
FOREIGN KEY (product_id)
REFERENCES Products(product_id);

ALTER TABLE Transactions_1997
ADD CONSTRAINT FK_Transactions97_Customers
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id);

ALTER TABLE Transactions_1997
ADD CONSTRAINT FK_Transactions97_Stores
FOREIGN KEY (store_id)
REFERENCES Stores(store_id);

ALTER TABLE Transactions_1998
ADD CONSTRAINT FK_Transactions98_Products
FOREIGN KEY (product_id)
REFERENCES Products(product_id);

ALTER TABLE Transactions_1998
ADD CONSTRAINT FK_Transactions98_Customers
FOREIGN KEY (customer_id)
REFERENCES Customers(customer_id);

ALTER TABLE Transactions_1998
ADD CONSTRAINT FK_Transactions98_Stores
FOREIGN KEY (store_id)
REFERENCES Stores(store_id);

ALTER TABLE Returns
ADD CONSTRAINT FK_Returns_Products
FOREIGN KEY (product_id)
REFERENCES Products(product_id);

