USE BankingDashboard;
GO

-- Clear existing data
TRUNCATE TABLE dbo.FactTransactions;
GO

INSERT INTO dbo.FactTransactions
(
    DateKey,
    CustomerKey,
    AccountKey,
    BranchKey,
    Amount,
    TransactionType,
    Channel
)

SELECT

    (YEAR(t.TransactionDate) * 10000)
    + (MONTH(t.TransactionDate) * 100)
    + DAY(t.TransactionDate) AS DateKey,

    dc.CustomerKey,

    da.AccountKey,

    db.BranchKey,

    t.Amount,

    t.TransactionType,

    t.Channel

FROM dbo.Transactions t

INNER JOIN dbo.Accounts a
    ON t.AccountID = a.AccountID

INNER JOIN dbo.Customers c
    ON a.CustomerID = c.CustomerID

INNER JOIN dbo.DimCustomer dc
    ON c.CustomerID = dc.CustomerID

INNER JOIN dbo.DimAccount da
    ON a.AccountID = da.AccountID

INNER JOIN dbo.DimBranch db
    ON c.BranchID = db.BranchID;
GO