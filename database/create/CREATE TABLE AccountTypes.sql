CREATE TABLE AccountTypes
(
    AccountTypeID INT IDENTITY PRIMARY KEY,
    AccountTypeName VARCHAR(50) NOT NULL
);

INSERT INTO AccountTypes (AccountTypeName)
VALUES
('Savings'),
('Current'),
('Domiciliary'),
('Fixed Deposit'),
('Corporate');