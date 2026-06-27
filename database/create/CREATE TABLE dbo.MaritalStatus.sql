CREATE TABLE dbo.MaritalStatus
(
    StatusID INT IDENTITY(1,1) PRIMARY KEY,
    StatusName VARCHAR(30)
);
GO

INSERT INTO dbo.MaritalStatus
VALUES
('Single'),
('Married'),
('Divorced'),
('Widowed');
GO