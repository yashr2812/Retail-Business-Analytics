USE MavenMarket;
GO


BULK INSERT dbo.Calendar
FROM 'C:\Users\rauty\Downloads\MavenMarket_Calendar.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO

BULK INSERT dbo.Customers
FROM 'C:\Users\rauty\Downloads\MavenMarket_Customers.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO


BULK INSERT dbo.Products
FROM 'C:\Users\rauty\Downloads\MavenMarket_Products.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO



BULK INSERT dbo.Regions
FROM 'C:\Users\rauty\Downloads\MavenMarket_Regions.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO



BULK INSERT dbo.Stores
FROM 'C:\Users\rauty\Downloads\MavenMarket_Stores.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO


BULK INSERT dbo.Returns
FROM 'C:\Users\rauty\Downloads\MavenMarket_Returns_1997-1998.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO


BULK INSERT dbo.Transactions_1997
FROM 'C:\Users\rauty\Downloads\MavenMarket_Transactions_1997.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO


BULK INSERT dbo.Transactions_1998
FROM 'C:\Users\rauty\Downloads\MavenMarket_Transactions_1998.csv'
WITH
(
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    TABLOCK
);
GO