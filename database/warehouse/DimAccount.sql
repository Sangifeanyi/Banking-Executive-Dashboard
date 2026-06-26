IF OBJECT_ID('dbo.DimAccount', 'U') IS NOT NULL
    DROP TABLE dbo.DimAccount;
GO

CREATE TABLE dbo.DimAccount
(
    AccountKey INT IDENTITY(1,1) PRIMARY KEY,

    AccountID INT,

    AccountNumber VARCHAR(20),

    AccountType VARCHAR(30)
);
GO