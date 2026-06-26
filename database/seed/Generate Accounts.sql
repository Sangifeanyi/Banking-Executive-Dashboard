DECLARE @CustomerID INT = 100001;

WHILE @CustomerID <= 105000
BEGIN

INSERT INTO Accounts
(
AccountNumber,
CustomerID,
AccountType,
Balance,
OpenDate
)

VALUES
(
'100'+CAST(@CustomerID AS VARCHAR(10)),

@CustomerID,

CHOOSE(
ABS(CHECKSUM(NEWID()))%3+1,
'Savings',
'Current',
'Fixed Deposit'
),

1000+ABS(CHECKSUM(NEWID()))%5000000,

DATEADD(DAY,-ABS(CHECKSUM(NEWID()))%3000,GETDATE())
);

IF RAND(CHECKSUM(NEWID()))>0.5

INSERT INTO Accounts
(
AccountNumber,
CustomerID,
AccountType,
Balance,
OpenDate
)

VALUES
(
'200'+CAST(@CustomerID AS VARCHAR(10)),

@CustomerID,

'Savings',

1000+ABS(CHECKSUM(NEWID()))%2000000,

DATEADD(DAY,-ABS(CHECKSUM(NEWID()))%3000,GETDATE())
);

SET @CustomerID=@CustomerID+1;

END

GO