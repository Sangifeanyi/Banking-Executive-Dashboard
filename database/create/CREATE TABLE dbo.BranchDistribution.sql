drop TABLE if EXISTs dbo.BranchDistribution
CREATE TABLE dbo.BranchDistribution
(
    BranchID INT PRIMARY KEY,
    CustomerWeight INT NOT NULL
);
GO

