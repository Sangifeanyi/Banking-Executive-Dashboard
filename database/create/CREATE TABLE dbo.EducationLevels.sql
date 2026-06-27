CREATE TABLE dbo.EducationLevels
(
    EducationID INT IDENTITY(1,1) PRIMARY KEY,
    EducationLevel VARCHAR(50)
);
GO

INSERT INTO dbo.EducationLevels
VALUES
('Primary'),
('Secondary'),
('OND'),
('HND'),
('Bachelor''s Degree'),
('Master''s Degree'),
('PhD');
GO