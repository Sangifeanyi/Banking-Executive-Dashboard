USE BankingDashboard;
GO

IF OBJECT_ID('dbo.fn_CalculateAge', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_CalculateAge;
GO

CREATE FUNCTION dbo.fn_CalculateAge
(
    @DateOfBirth DATE
)
RETURNS INT
AS
BEGIN

    DECLARE @Age INT;

    SET @Age =
        DATEDIFF(YEAR, @DateOfBirth, GETDATE())
        - CASE
            WHEN DATEADD(YEAR, DATEDIFF(YEAR, @DateOfBirth, GETDATE()), @DateOfBirth) > GETDATE()
            THEN 1
            ELSE 0
          END;

    RETURN @Age;

END;
GO