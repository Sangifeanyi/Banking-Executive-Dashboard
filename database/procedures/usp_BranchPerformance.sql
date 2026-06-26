USE BankingDashboard;
GO

CREATE OR ALTER PROCEDURE dbo.usp_BranchPerformance
AS
BEGIN

SET NOCOUNT ON;

SELECT

    b.BranchName,

    COUNT(DISTINCT c.CustomerID) AS Customers,

    COUNT(a.AccountID) AS Accounts,

    ISNULL(SUM(a.Balance),0) AS Deposits,

    ISNULL(AVG(a.Balance),0) AS AverageBalance

FROM Branches b

LEFT JOIN Customers c
ON b.BranchID=c.BranchID

LEFT JOIN Accounts a
ON c.CustomerID=a.CustomerID

GROUP BY

b.BranchName

ORDER BY

Deposits DESC;

END
GO