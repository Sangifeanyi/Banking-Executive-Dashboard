USE BankingDashboard;
GO

IF OBJECT_ID('dbo.fn_AgeGroup', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_AgeGroup;
GO

CREATE FUNCTION dbo.fn_AgeGroup
(
    @Age INT
)
RETURNS VARCHAR(20)
AS
BEGIN

    DECLARE @AgeGroup VARCHAR(20);

    SET @AgeGroup =
    CASE
        WHEN @Age < 25 THEN '18-24'
        WHEN @Age < 35 THEN '25-34'
        WHEN @Age < 45 THEN '35-44'
        WHEN @Age < 55 THEN '45-54'
        ELSE '55+'
    END;

    RETURN @AgeGroup;

END;
GO