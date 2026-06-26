USE BankingDashboard;
GO

IF OBJECT_ID('dbo.vw_CustomerSummary', 'V') IS NOT NULL
    DROP VIEW dbo.vw_CustomerSummary;
GO

CREATE VIEW dbo.vw_CustomerSummary
AS

SELECT

    c.CustomerID,

    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,

    c.Gender,

    dbo.fn_CalculateAge(c.DateOfBirth) AS Age,

    dbo.fn_AgeGroup
    (
        dbo.fn_CalculateAge(c.DateOfBirth)
    ) AS AgeGroup,

    c.Occupation,

    c.MonthlyIncome,

    c.CustomerSince,

    c.CustomerStatus,

    b.BranchID,

    b.BranchCode,

    b.BranchName,

    b.State,

    COUNT(DISTINCT a.AccountID) AS TotalAccounts,

    ISNULL(SUM(a.Balance),0) AS TotalBalance,

    ISNULL(AVG(a.Balance),0) AS AverageBalance,

    MAX(a.Balance) AS HighestAccountBalance,

    MIN(a.Balance) AS LowestAccountBalance,

    dbo.fn_RiskCategory
    (
        ISNULL(SUM(a.Balance),0)
    ) AS CustomerTier

FROM dbo.Customers c

INNER JOIN dbo.Branches b
    ON c.BranchID = b.BranchID

LEFT JOIN dbo.Accounts a
    ON c.CustomerID = a.CustomerID

GROUP BY

    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Gender,
    c.DateOfBirth,
    c.Occupation,
    c.MonthlyIncome,
    c.CustomerSince,
    c.CustomerStatus,

    b.BranchID,
    b.BranchCode,
    b.BranchName,
    b.State;

GO