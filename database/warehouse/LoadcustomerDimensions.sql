INSERT INTO dbo.DimCustomer
(
    CustomerID,
    CustomerName,
    Gender,
    Occupation,
    CustomerSince
)
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName),
    Gender,
    Occupation,
    CustomerSince
FROM dbo.Customers;
GO