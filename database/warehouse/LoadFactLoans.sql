USE BankingDashboard;
GO

TRUNCATE TABLE dbo.FactLoans;
GO

INSERT INTO dbo.FactLoans
(
    DateKey,
    CustomerKey,
    BranchKey,
    LoanAmount,
    OutstandingBalance,
    InterestRate,
    LoanStatus
)

SELECT

    (YEAR(l.StartDate) * 10000)
    + (MONTH(l.StartDate) * 100)
    + DAY(l.StartDate),

    dc.CustomerKey,

    db.BranchKey,

    l.LoanAmount,

    l.OutstandingBalance,

    l.InterestRate,

    l.LoanStatus

FROM dbo.Loans l

INNER JOIN dbo.Customers c
    ON l.CustomerID = c.CustomerID

INNER JOIN dbo.DimCustomer dc
    ON c.CustomerID = dc.CustomerID

INNER JOIN dbo.DimBranch db
    ON c.BranchID = db.BranchID;
GO