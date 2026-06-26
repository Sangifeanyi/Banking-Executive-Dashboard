USE BankingDashboard;
GO

CREATE OR ALTER PROCEDURE dbo.usp_MonthlyTransactions
(
    @Year INT
)
AS
BEGIN

SET NOCOUNT ON;

SELECT

MONTH(TransactionDate) AS MonthNo,

DATENAME(MONTH,TransactionDate) AS MonthName,

COUNT(*) AS Transactions,

SUM(Amount) AS TotalAmount

FROM Transactions

WHERE YEAR(TransactionDate)=@Year

GROUP BY

MONTH(TransactionDate),
DATENAME(MONTH,TransactionDate)

ORDER BY

MonthNo;

END
GO