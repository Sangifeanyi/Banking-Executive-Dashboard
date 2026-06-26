USE BankingDashboard;
GO

CREATE OR ALTER PROCEDURE dbo.usp_LoanPortfolioSummary
AS
BEGIN

SET NOCOUNT ON;

SELECT

LoanStatus,

COUNT(*) AS Loans,

SUM(LoanAmount) AS LoanAmount,

SUM(OutstandingBalance) AS OutstandingBalance

FROM Loans

GROUP BY LoanStatus;

END
GO