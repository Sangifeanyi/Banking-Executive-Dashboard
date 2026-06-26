ALTER TABLE dbo.FactTransactions
ADD CONSTRAINT FK_FT_Date
FOREIGN KEY (DateKey)
REFERENCES dbo.DimDate(DateKey);

ALTER TABLE dbo.FactTransactions
ADD CONSTRAINT FK_FT_Customer
FOREIGN KEY (CustomerKey)
REFERENCES dbo.DimCustomer(CustomerKey);

ALTER TABLE dbo.FactTransactions
ADD CONSTRAINT FK_FT_Account
FOREIGN KEY (AccountKey)
REFERENCES dbo.DimAccount(AccountKey);

ALTER TABLE dbo.FactTransactions
ADD CONSTRAINT FK_FT_Branch
FOREIGN KEY (BranchKey)
REFERENCES dbo.DimBranch(BranchKey);