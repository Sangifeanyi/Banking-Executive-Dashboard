USE BankingDashboard;
GO

IF OBJECT_ID('dbo.DimBranch', 'U') IS NOT NULL
    DROP TABLE dbo.DimBranch;
GO

CREATE TABLE dbo.DimBranch
(
    BranchKey INT IDENTITY(1,1) PRIMARY KEY,

    BranchID INT NOT NULL,

    BranchCode VARCHAR(10),

    BranchName VARCHAR(100),

    State VARCHAR(50),

    City VARCHAR(50)
);
GO