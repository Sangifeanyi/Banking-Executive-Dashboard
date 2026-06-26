CREATE TABLE LoanTypes
(
    LoanTypeID INT IDENTITY PRIMARY KEY,
    LoanTypeName VARCHAR(100) NOT NULL
);

INSERT INTO LoanTypes (LoanTypeName)
VALUES
('Mortgage Loan'),
('Personal Loan'),
('Salary Advance'),
('Vehicle Loan'),
('Education Loan'),
('SME Loan'),
('Agricultural Loan'),
('Business Expansion Loan');