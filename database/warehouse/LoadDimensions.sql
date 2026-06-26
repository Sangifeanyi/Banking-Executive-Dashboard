INSERT INTO dbo.DimBranch
(
    BranchID,
    BranchCode,
    BranchName,
    State,
    City
)
SELECT
    BranchID,
    BranchCode,
    BranchName,
    State,
    City
FROM dbo.Branches;
GO