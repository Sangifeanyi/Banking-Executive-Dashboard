SELECT
    (SELECT COUNT(*) FROM dbo.Branches) AS SourceBranches,
    (SELECT COUNT(*) FROM dbo.DimBranch) AS WarehouseBranches;

SELECT
    (SELECT COUNT(*) FROM dbo.Customers) AS SourceCustomers,
    (SELECT COUNT(*) FROM dbo.DimCustomer) AS WarehouseCustomers;

SELECT
    (SELECT COUNT(*) FROM dbo.Accounts) AS SourceAccounts,
    (SELECT COUNT(*) FROM dbo.DimAccount) AS WarehouseAccounts;

SELECT
    (SELECT COUNT(*) FROM dbo.Transactions) AS SourceTransactions,
    (SELECT COUNT(*) FROM dbo.FactTransactions) AS WarehouseTransactions;

SELECT
    (SELECT COUNT(*) FROM dbo.Loans) AS SourceLoans,
    (SELECT COUNT(*) FROM dbo.FactLoans) AS WarehouseLoans;