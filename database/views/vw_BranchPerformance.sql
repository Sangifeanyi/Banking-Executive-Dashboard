USE BankingDashboard;
GO

IF OBJECT_ID('dbo.vw_BranchPerformance','V') IS NOT NULL
    DROP VIEW dbo.vw_BranchPerformance;
GO

CREATE VIEW dbo.vw_BranchPerformance
AS

SELECT

    b.BranchID,
    b.BranchCode,
    b.BranchName,
    b.State,

    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,

    COUNT(a.AccountID) AS TotalAccounts,

    SUM(ISNULL(a.Balance,0)) AS TotalDeposits,

    AVG(ISNULL(a.Balance,0)) AS AverageBalance

FROM Branches b

LEFT JOIN Customers c
ON b.BranchID = c.BranchID

LEFT JOIN Accounts a
ON c.CustomerID = a.CustomerID

GROUP BY

    b.BranchID,
    b.BranchCode,
    b.BranchName,
    b.State;

GO