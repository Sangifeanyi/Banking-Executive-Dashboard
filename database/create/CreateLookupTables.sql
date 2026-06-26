CREATE TABLE Occupations
(
    OccupationID INT IDENTITY PRIMARY KEY,
    OccupationName VARCHAR(100) NOT NULL
);

INSERT INTO Occupations (OccupationName)
VALUES
('Banker'),
('Civil Servant'),
('Software Developer'),
('Medical Doctor'),
('Lawyer'),
('Teacher'),
('Engineer'),
('Accountant'),
('Business Owner'),
('Trader'),
('Farmer'),
('Student'),
('Nurse'),
('Police Officer'),
('Lecturer'),
('Architect'),
('Pilot'),
('Pharmacist'),
('Consultant'),
('Entrepreneur');