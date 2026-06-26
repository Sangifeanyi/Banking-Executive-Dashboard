USE BankingDashboard;
GO

IF OBJECT_ID('dbo.DimDate', 'U') IS NOT NULL
    DROP TABLE dbo.DimDate;
GO

CREATE TABLE dbo.DimDate
(
    DateKey INT NOT NULL PRIMARY KEY,
    FullDate DATE NOT NULL,
    DayNumber TINYINT NOT NULL,
    DayName VARCHAR(20) NOT NULL,
    WeekNumber TINYINT NOT NULL,
    MonthNumber TINYINT NOT NULL,
    MonthName VARCHAR(20) NOT NULL,
    QuarterNumber TINYINT NOT NULL,
    QuarterName VARCHAR(10) NOT NULL,
    YearNumber SMALLINT NOT NULL,
    IsWeekend BIT NOT NULL,
    FinancialYear VARCHAR(10) NULL
);
GO