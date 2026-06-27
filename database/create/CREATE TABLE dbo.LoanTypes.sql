drop TABLE dbo.LoanTypes
CREATE TABLE dbo.LoanTypes
(
    LoanTypeID INT IDENTITY(1,1) PRIMARY KEY,
    LoanTypeName VARCHAR(50),
    MaxTenureMonths INT
);
GO

INSERT INTO dbo.LoanTypes
VALUES
('Personal Loan',36),
('Mortgage',240),
('Car Loan',60),
('SME Loan',60),
('Education Loan',48),
('Salary Advance',12);
GO