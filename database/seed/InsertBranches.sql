USE BankingDashboard;
GO

-- Only use DELETE because Branches is referenced by foreign keys
DELETE FROM dbo.Branches;
GO

INSERT INTO dbo.Branches
(
    BranchCode,
    BranchName,
    State,
    City,
    ManagerName,
    OpenDate,
    Status
)
VALUES
('LAG001','Victoria Island','Lagos','Lagos','Adebayo Johnson','2012-01-15','Active'),
('LAG002','Ikeja','Lagos','Ikeja','Chioma Okeke','2013-05-20','Active'),
('LAG003','Lekki','Lagos','Lekki','Oluwaseun Bello','2016-09-11','Active'),
('ABJ001','Wuse','FCT','Abuja','Fatima Ibrahim','2014-03-01','Active'),
('ABJ002','Garki','FCT','Abuja','Emmanuel Musa','2017-06-14','Active'),
('PH001','GRA','Rivers','Port Harcourt','Grace Douglas','2015-10-02','Active'),
('KAN001','Kano Central','Kano','Kano','Sani Abdullahi','2013-08-17','Active'),
('ENU001','Independence Layout','Enugu','Enugu','Ifeanyi Nwosu','2018-01-22','Active'),
('IBD001','Dugbe','Oyo','Ibadan','Akin Adeoye','2012-12-05','Active'),
('BEN001','Ring Road','Edo','Benin City','Mercy Eboh','2014-11-09','Active'),
('OWR001','Owerri','Imo','Owerri','Chukwuma Obi','2018-02-18','Active'),
('ASA001','Asaba','Delta','Asaba','Rita Okon','2017-07-10','Active'),
('ABA001','Aba Main','Abia','Aba','Kingsley Uche','2015-04-06','Active'),
('JOS001','Jos Central','Plateau','Jos','Sarah Dung','2016-01-27','Active'),
('MAK001','Makurdi','Benue','Makurdi','Terhemba Iorfa','2019-05-30','Active'),
('KAD001','Kaduna Central','Kaduna','Kaduna','Ibrahim Shehu','2013-09-12','Active'),
('ILR001','Ilorin','Kwara','Ilorin','Bisi Ogunleye','2015-11-25','Active'),
('CAL001','Calabar','Cross River','Calabar','Edet Effiong','2018-08-08','Active'),
('AKU001','Uyo','Akwa Ibom','Uyo','Nsikak Akpan','2016-04-13','Active'),
('ONI001','Onitsha','Anambra','Onitsha','Ngozi Eze','2014-02-21','Active');
GO