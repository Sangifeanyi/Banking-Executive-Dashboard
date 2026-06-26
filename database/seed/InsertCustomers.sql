USE BankingDashboard;
GO

;WITH Numbers AS
(
    SELECT TOP (10000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS N
    FROM sys.objects a
    CROSS JOIN sys.objects b
),
CustomerRandom AS
(
    SELECT
        N,
        CASE WHEN ABS(CHECKSUM(NEWID())) % 2 = 0 THEN 'M' ELSE 'F' END AS Gender,
        ABS(CHECKSUM(NEWID())) % 20 + 1 AS MaleRow,
        ABS(CHECKSUM(NEWID())) % 20 + 1 AS FemaleRow,
        ABS(CHECKSUM(NEWID())) % 20 + 1 AS LastRow,
        ABS(CHECKSUM(NEWID())) % 20 + 1 AS OccupationRow
    FROM Numbers
)

INSERT INTO dbo.Customers
(
    FirstName,
    LastName,
    Gender,
    DateOfBirth,
    PhoneNumber,
    Email,
    Occupation,
    MonthlyIncome,
    CustomerSince,
    BranchID,
    CustomerStatus
)

SELECT

CASE
    WHEN R.Gender='M'
        THEN MF.Name
    ELSE FF.Name
END,

LN.Name,

R.Gender,

DATEADD
(
    DAY,
    -(8000 + ABS(CHECKSUM(NEWID())) % 12000),
    CAST(GETDATE() AS DATE)
),

'080' +
RIGHT
(
    '00000000' +
    CAST(ABS(CHECKSUM(NEWID())) % 100000000 AS VARCHAR(8)),
    8
),

LOWER
(
CASE
    WHEN R.Gender='M'
        THEN MF.Name
    ELSE FF.Name
END
)
+'.'
+LOWER(LN.Name)
+CAST(R.N AS VARCHAR(5))
+'@gmail.com',

O.OccupationName,

CASE O.OccupationName

WHEN 'Student' THEN 50000
WHEN 'Teacher' THEN 180000
WHEN 'Civil Servant' THEN 250000
WHEN 'Software Developer' THEN 850000
WHEN 'Medical Doctor' THEN 1200000
WHEN 'Lawyer' THEN 950000
WHEN 'Engineer' THEN 700000
WHEN 'Banker' THEN 650000
WHEN 'Accountant' THEN 450000
WHEN 'Business Owner' THEN 1500000
WHEN 'Trader' THEN 300000
WHEN 'Farmer' THEN 200000
WHEN 'Nurse' THEN 450000
WHEN 'Police Officer' THEN 220000
WHEN 'Architect' THEN 700000
WHEN 'Pilot' THEN 1800000
WHEN 'Pharmacist' THEN 650000
WHEN 'Consultant' THEN 1000000
WHEN 'Entrepreneur' THEN 2000000
ELSE 350000

END,

DATEADD
(
    DAY,
    -(ABS(CHECKSUM(NEWID())) % 3650),
    CAST(GETDATE() AS DATE)
),

B.BranchID,

CASE
    WHEN ABS(CHECKSUM(NEWID())) % 100 < 95
        THEN 'Active'
    ELSE 'Inactive'
END

FROM CustomerRandom R

LEFT JOIN dbo.vw_MaleFirstNames MF
    ON R.MaleRow = MF.RowNum

LEFT JOIN dbo.vw_FemaleFirstNames FF
    ON R.FemaleRow = FF.RowNum

LEFT JOIN dbo.vw_LastNames LN
    ON R.LastRow = LN.RowNum

LEFT JOIN dbo.vw_Occupations O
    ON R.OccupationRow = O.RowNum

CROSS APPLY
(
    SELECT TOP (1) BranchID
    FROM dbo.Branches
    ORDER BY NEWID()
) B;
GO