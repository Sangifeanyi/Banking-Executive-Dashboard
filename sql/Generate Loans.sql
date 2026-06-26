DECLARE @Loan INT=1;

WHILE @Loan<=2000
BEGIN

INSERT INTO Loans
(
CustomerID,
LoanType,
LoanAmount,
InterestRate,
LoanTermMonths,
StartDate,
EndDate,
OutstandingBalance,
LoanStatus
)

VALUES
(

100001+ABS(CHECKSUM(NEWID()))%5000,

CHOOSE(
ABS(CHECKSUM(NEWID()))%4+1,
'Mortgage',
'Personal',
'Vehicle',
'Business'),

100000+ABS(CHECKSUM(NEWID()))%25000000,

8+ABS(CHECKSUM(NEWID()))%15,

12+ABS(CHECKSUM(NEWID()))%60,

DATEADD(DAY,-ABS(CHECKSUM(NEWID()))%2000,GETDATE()),

DATEADD(DAY,365,GETDATE()),

10000+ABS(CHECKSUM(NEWID()))%5000000,

CHOOSE(
ABS(CHECKSUM(NEWID()))%3+1,
'Active',
'Closed',
'Defaulted')

);

SET @Loan=@Loan+1;

END
GO