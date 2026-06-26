IF OBJECT_ID('dbo.DimCustomer', 'U') IS NOT NULL
    DROP TABLE dbo.DimCustomer;
GO

CREATE TABLE dbo.DimCustomer
(
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,

    CustomerID INT,

    CustomerName VARCHAR(150),

    Gender CHAR(1),

    Occupation VARCHAR(100),

    CustomerSince DATE
);
GO