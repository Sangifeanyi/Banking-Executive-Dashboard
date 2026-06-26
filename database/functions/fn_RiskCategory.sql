USE BankingDashboard;
GO

IF OBJECT_ID('dbo.fn_RiskCategory', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_RiskCategory;
GO

CREATE FUNCTION dbo.fn_RiskCategory
(
    @Balance DECIMAL(18,2)
)
RETURNS VARCHAR(20)
AS
BEGIN

    DECLARE @Risk VARCHAR(20);

    SET @Risk =
    CASE

        WHEN @Balance >= 5000000
            THEN 'Premium'

        WHEN @Balance >= 1000000
            THEN 'Gold'

        WHEN @Balance >= 250000
            THEN 'Silver'

        ELSE 'Regular'

    END;

    RETURN @Risk;

END;
GO