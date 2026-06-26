INSERT INTO dbo.DimAccount
(
    AccountID,
    AccountNumber,
    AccountType
)
SELECT
    AccountID,
    AccountNumber,
    AccountType
FROM dbo.Accounts;
GO