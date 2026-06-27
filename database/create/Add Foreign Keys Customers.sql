ALTER TABLE dbo.Customers
ADD CONSTRAINT FK_Customers_Education
FOREIGN KEY(EducationID)
REFERENCES dbo.EducationLevels(EducationID);
GO

ALTER TABLE dbo.Customers
ADD CONSTRAINT FK_Customers_MaritalStatus
FOREIGN KEY(MaritalStatusID)
REFERENCES dbo.MaritalStatus(StatusID);
GO

ALTER TABLE dbo.Customers
ADD CONSTRAINT FK_Customers_Segment
FOREIGN KEY(SegmentID)
REFERENCES dbo.CustomerSegments(SegmentID);
GO