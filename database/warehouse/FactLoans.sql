IF OBJECT_ID('dbo.FactLoans', 'U') IS NOT NULL
    DROP TABLE dbo.FactLoans;
GO

CREATE TABLE dbo.FactLoans
(
    LoanKey INT IDENTITY(1,1) PRIMARY KEY,

    DateKey INT,

    CustomerKey INT,

    BranchKey INT,

    LoanAmount DECIMAL(18,2),

    OutstandingBalance DECIMAL(18,2),

    InterestRate DECIMAL(5,2),

    LoanStatus VARCHAR(20)
);
GO