DROP TABLE IF EXISTS dbo.Occupations;
GO

CREATE TABLE dbo.Occupations
(
    OccupationID INT IDENTITY PRIMARY KEY,

    OccupationName VARCHAR(100),

    MinIncome DECIMAL(18,2),

    MaxIncome DECIMAL(18,2),

    SegmentID INT,

    LoanProbability INT,

    RiskLevel VARCHAR(20)
);
GO