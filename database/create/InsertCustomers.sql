USE BankingDashboard;
GO

-- Uncomment these lines if you want to regenerate customers
-- DELETE FROM dbo.Customers;
-- GO

;WITH Numbers AS
(
    SELECT TOP (10000)
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS N
    FROM sys.objects a
    CROSS JOIN sys.objects b
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
        WHEN G.GenderValue = 'M' THEN MF.Name
        ELSE FF.Name
    END AS FirstName,

    LN.Name AS LastName,

    G.GenderValue AS Gender,

    -- Age approximately 22–55 years
    DATEADD(DAY,
            -(8000 + ABS(CHECKSUM(NEWID())) % 12000),
            CAST(GETDATE() AS DATE)
    ) AS DateOfBirth,

    '080' +
    RIGHT(
        '00000000' +
        CAST(ABS(CHECKSUM(NEWID())) % 100000000 AS VARCHAR(8)),
        8
    ) AS PhoneNumber,

    LOWER(
        CASE
            WHEN G.GenderValue='M' THEN MF.Name
            ELSE FF.Name
        END
    )
    + '.'
    + LOWER(LN.Name)
    + CAST(N AS VARCHAR(5))
    + '@gmail.com' AS Email,

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
        WHEN 'Lecturer' THEN 500000
        WHEN 'Architect' THEN 700000
        WHEN 'Pilot' THEN 1800000
        WHEN 'Pharmacist' THEN 650000
        WHEN 'Consultant' THEN 1000000
        WHEN 'Entrepreneur' THEN 2000000

        ELSE 350000

    END AS MonthlyIncome,

    DATEADD
    (
        DAY,
        -(ABS(CHECKSUM(NEWID())) % 3650),
        CAST(GETDATE() AS DATE)
    ) AS CustomerSince,

    B.BranchID,

    CASE
        WHEN ABS(CHECKSUM(NEWID())) % 100 < 95
            THEN 'Active'
        ELSE 'Inactive'
    END AS CustomerStatus

FROM Numbers

CROSS APPLY
(
    SELECT
        CASE
            WHEN ABS(CHECKSUM(NEWID())) % 2 = 0
                THEN 'M'
            ELSE 'F'
        END AS GenderValue
) G

CROSS APPLY
(
    SELECT TOP (1) Name
    FROM dbo.MaleFirstNames
    ORDER BY NEWID()
) MF

CROSS APPLY
(
    SELECT TOP (1) Name
    FROM dbo.FemaleFirstNames
    ORDER BY NEWID()
) FF

CROSS APPLY
(
    SELECT TOP (1) Name
    FROM dbo.LastNames
    ORDER BY NEWID()
) LN

CROSS APPLY
(
    SELECT TOP (1) OccupationName
    FROM dbo.Occupations
    ORDER BY NEWID()
) O

CROSS APPLY
(
    SELECT TOP (1) BranchID
    FROM dbo.Branches
    ORDER BY NEWID()
) B;
GO