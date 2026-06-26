USE BankingDashboard;
GO

IF OBJECT_ID('dbo.vw_LoanPortfolio','V') IS NOT NULL
    DROP VIEW dbo.vw_LoanPortfolio;
GO

CREATE VIEW dbo.vw_LoanPortfolio
AS

SELECT

    l.LoanID,

    CONCAT(c.FirstName,' ',c.LastName) AS Customer,

    b.BranchName,

    l.LoanType,

    l.LoanAmount,

    l.OutstandingBalance,

    l.InterestRate,

    l.LoanTermMonths,

    l.StartDate,

    l.EndDate,

    l.LoanStatus

FROM Loans l

INNER JOIN Customers c
ON l.CustomerID = c.CustomerID

INNER JOIN Branches b
ON c.BranchID = b.BranchID;

GO