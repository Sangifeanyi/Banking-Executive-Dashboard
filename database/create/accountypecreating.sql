
CREATE TABLE dbo.AccountTypes
(
    AccountTypeID INT IDENTITY(1,1) PRIMARY KEY,
    AccountTypeName VARCHAR(50),
    MinimumBalance DECIMAL(18,2),
    InterestRate DECIMAL(5,2)
);
GO

INSERT INTO dbo.AccountTypes
VALUES
('Savings',1000,4.50),
('Current',0,0),
('Fixed Deposit',50000,8.50),
('Domiciliary',100,0);
GO