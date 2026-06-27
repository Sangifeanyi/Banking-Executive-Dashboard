USE BankingDashboard;
GO

-- Education
IF COL_LENGTH('dbo.Customers','EducationID') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD EducationID INT NULL;
END
GO

-- Marital Status
IF COL_LENGTH('dbo.Customers','MaritalStatusID') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD MaritalStatusID INT NULL;
END
GO

-- Customer Segment
IF COL_LENGTH('dbo.Customers','SegmentID') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD SegmentID INT NULL;
END
GO

-- Risk Score
IF COL_LENGTH('dbo.Customers','RiskScore') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD RiskScore INT NULL;
END
GO

-- Employment Status
IF COL_LENGTH('dbo.Customers','EmploymentStatus') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD EmploymentStatus VARCHAR(30) NULL;
END
GO

-- Annual Income
IF COL_LENGTH('dbo.Customers','AnnualIncome') IS NULL
BEGIN
    ALTER TABLE dbo.Customers
    ADD AnnualIncome DECIMAL(18,2) NULL;
END
GO