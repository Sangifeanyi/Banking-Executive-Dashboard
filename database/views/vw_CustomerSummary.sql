USE BankingDashboard;
GO

IF OBJECT_ID('dbo.vw_CustomerSummary','V') IS NOT NULL
    DROP VIEW dbo.vw_CustomerSummary;
GO

CREATE VIEW dbo.vw_CustomerSummary
AS

SELECT

    c.CustomerID,

    CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,

    c.Gender,

    DATEDIFF(YEAR,c.DateOfBirth,GETDATE())
      - CASE
            WHEN DATEADD(YEAR,DATEDIFF(YEAR,c.DateOfBirth,GETDATE()),c.DateOfBirth) > GETDATE()
            THEN 1
            ELSE 0
        END AS Age,

    CASE

        WHEN DATEDIFF(YEAR,c.DateOfBirth,GETDATE()) < 25 THEN '18-24'

        WHEN DATEDIFF(YEAR,c.DateOfBirth,GETDATE()) < 35 THEN '25-34'

        WHEN DATEDIFF(YEAR,c.DateOfBirth,GETDATE()) < 45 THEN '35-44'

        WHEN DATEDIFF(YEAR,c.DateOfBirth,GETDATE()) < 55 THEN '45-54'

        ELSE '55+'

    END AS AgeGroup,

    c.Occupation,

    b.BranchName,

    COUNT(a.AccountID) AS TotalAccounts,

    SUM(ISNULL(a.Balance,0)) AS TotalBalance,

    AVG(ISNULL(a.Balance,0)) AS AverageBalance

FROM Customers c

LEFT JOIN Accounts a
ON c.CustomerID = a.CustomerID

INNER JOIN Branches b
ON c.BranchID = b.BranchID

GROUP BY

c.CustomerID,
c.FirstName,
c.LastName,
c.Gender,
c.DateOfBirth,
c.Occupation,
b.BranchName;

GO