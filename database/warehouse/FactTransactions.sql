IF OBJECT_ID('dbo.FactTransactions', 'U') IS NOT NULL
    DROP TABLE dbo.FactTransactions;
GO

CREATE TABLE dbo.FactTransactions
(
    TransactionKey BIGINT IDENTITY(1,1) PRIMARY KEY,

    DateKey INT,

    CustomerKey INT,

    AccountKey INT,

    BranchKey INT,

    Amount DECIMAL(18,2),

    TransactionType VARCHAR(20),

    Channel VARCHAR(30)
);
GO