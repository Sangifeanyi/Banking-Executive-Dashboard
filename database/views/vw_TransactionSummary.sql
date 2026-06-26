USE BankingDashboard;
GO

IF OBJECT_ID('dbo.vw_TransactionSummary','V') IS NOT NULL
    DROP VIEW dbo.vw_TransactionSummary;
GO

CREATE VIEW dbo.vw_TransactionSummary
AS

SELECT

    CAST(TransactionDate AS DATE) AS TransactionDate,

    TransactionType,

    Channel,

    COUNT(*) AS NumberOfTransactions,

    SUM(Amount) AS TotalAmount,

    AVG(Amount) AS AverageAmount

FROM Transactions

GROUP BY

CAST(TransactionDate AS DATE),
TransactionType,
Channel;

GO