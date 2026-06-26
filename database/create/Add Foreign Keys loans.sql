ALTER TABLE dbo.FactLoans
ADD CONSTRAINT FK_FL_Date
FOREIGN KEY (DateKey)
REFERENCES dbo.DimDate(DateKey);

ALTER TABLE dbo.FactLoans
ADD CONSTRAINT FK_FL_Customer
FOREIGN KEY (CustomerKey)
REFERENCES dbo.DimCustomer(CustomerKey);

ALTER TABLE dbo.FactLoans
ADD CONSTRAINT FK_FL_Branch
FOREIGN KEY (BranchKey)
REFERENCES dbo.DimBranch(BranchKey);