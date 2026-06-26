USE BankingDashboard;
GO

CREATE OR ALTER PROCEDURE dbo.usp_CustomerGrowth
AS
BEGIN

SET NOCOUNT ON;

SELECT

YEAR(CustomerSince) AS Year,

MONTH(CustomerSince) AS Month,

COUNT(*) AS NewCustomers

FROM Customers

GROUP BY

YEAR(CustomerSince),
MONTH(CustomerSince)

ORDER BY

Year,
Month;

END
GO