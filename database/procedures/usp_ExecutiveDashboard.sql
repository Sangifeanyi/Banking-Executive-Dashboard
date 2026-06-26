USE BankingDashboard;
GO

CREATE OR ALTER PROCEDURE dbo.usp_ExecutiveDashboard
AS
BEGIN

SET NOCOUNT ON;

SELECT

    (SELECT COUNT(*) FROM Customers) AS TotalCustomers,

    (SELECT COUNT(*) FROM Accounts) AS TotalAccounts,

    (
        SELECT ISNULL(SUM(Balance),0)
        FROM Accounts
    ) AS TotalDeposits,

    (
        SELECT ISNULL(AVG(Balance),0)
        FROM Accounts
    ) AS AverageBalance,

    (
        SELECT COUNT(*)
        FROM Loans
    ) AS TotalLoans,

    (
        SELECT ISNULL(SUM(OutstandingBalance),0)
        FROM Loans
    ) AS OutstandingLoans,

    (
        SELECT COUNT(*)
        FROM Transactions
        WHERE CAST(TransactionDate AS DATE)=CAST(GETDATE() AS DATE)
    ) AS TodayTransactions,

    (
        SELECT ISNULL(SUM(Amount),0)
        FROM Transactions
        WHERE TransactionType='Credit'
    ) AS TotalCredits,

    (
        SELECT ISNULL(SUM(Amount),0)
        FROM Transactions
        WHERE TransactionType='Debit'
    ) AS TotalDebits;

END
GO