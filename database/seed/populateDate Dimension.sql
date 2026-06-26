DECLARE @StartDate DATE='2020-01-01';
DECLARE @EndDate DATE='2035-12-31';

WHILE @StartDate<=@EndDate
BEGIN

INSERT INTO dbo.DimDate
(
    DateKey,
    FullDate,
    DayNumber,
    DayName,
    WeekNumber,
    MonthNumber,
    MonthName,
    QuarterNumber,
    QuarterName,
    YearNumber,
    IsWeekend,
    FinancialYear
)

VALUES
(

CONVERT(INT,FORMAT(@StartDate,'yyyyMMdd')),

@StartDate,

DAY(@StartDate),

DATENAME(WEEKDAY,@StartDate),

DATEPART(WEEK,@StartDate),

MONTH(@StartDate),

DATENAME(MONTH,@StartDate),

DATEPART(QUARTER,@StartDate),

'Q'+CAST(DATEPART(QUARTER,@StartDate) AS VARCHAR(1)),

YEAR(@StartDate),

CASE
WHEN DATENAME(WEEKDAY,@StartDate) IN ('Saturday','Sunday')
THEN 1
ELSE 0
END,

CAST(YEAR(@StartDate) AS VARCHAR(4))

);

SET @StartDate=DATEADD(DAY,1,@StartDate);

END
GO