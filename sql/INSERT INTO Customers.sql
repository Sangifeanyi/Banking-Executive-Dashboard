SET NOCOUNT ON;

DECLARE @i INT = 1;

WHILE @i <= 5000
BEGIN

INSERT INTO Customers
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
BranchID
)

VALUES
(
'Customer'+CAST(@i AS VARCHAR(10)),
'Lastname'+CAST(@i AS VARCHAR(10)),

CASE
WHEN RAND(CHECKSUM(NEWID())) > 0.5 THEN 'M'
ELSE 'F'
END,

DATEADD(DAY,-ABS(CHECKSUM(NEWID()))%18000,GETDATE()),

'0803'+RIGHT('0000000'+CAST(@i AS VARCHAR(7)),7),

'customer'+CAST(@i AS VARCHAR(10))+'@gmail.com',

CHOOSE(
ABS(CHECKSUM(NEWID()))%6+1,
'Engineer',
'Teacher',
'Doctor',
'Trader',
'Lawyer',
'Civil Servant'
),

50000+ABS(CHECKSUM(NEWID()))%1500000,

DATEADD(DAY,-ABS(CHECKSUM(NEWID()))%3500,GETDATE()),

ABS(CHECKSUM(NEWID()))%20+1

);

SET @i=@i+1;

END

GO