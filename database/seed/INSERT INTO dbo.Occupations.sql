INSERT INTO dbo.Occupations
(
OccupationName,
MinIncome,
MaxIncome,
SegmentID,
LoanProbability,
RiskLevel
)
VALUES
('Student',10000,80000,6,0,'Low'),
('Teacher',120000,300000,2,40,'Low'),
('Civil Servant',150000,500000,2,60,'Low'),
('Software Developer',500000,3000000,1,20,'Low'),
('Medical Doctor',700000,5000000,5,15,'Low'),
('Lawyer',500000,4000000,5,20,'Low'),
('Engineer',300000,2500000,1,25,'Low'),
('Banker',250000,1800000,2,40,'Low'),
('Business Owner',300000,20000000,3,80,'Medium'),
('Trader',80000,800000,3,60,'Medium'),
('Farmer',60000,600000,3,50,'Medium'),
('Nurse',200000,900000,2,35,'Low'),
('Police Officer',120000,400000,2,50,'Medium'),
('Architect',350000,2500000,1,25,'Low'),
('Pilot',1200000,6000000,5,10,'Low'),
('Pharmacist',300000,1800000,1,20,'Low'),
('Consultant',800000,5000000,5,15,'Low'),
('Entrepreneur',500000,25000000,3,85,'High'),
('Accountant',250000,1500000,2,35,'Low'),
('Lecturer',250000,1800000,2,30,'Low');
GO