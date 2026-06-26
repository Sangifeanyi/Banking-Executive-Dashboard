CREATE TABLE Channels
(
    ChannelID INT IDENTITY PRIMARY KEY,
    ChannelName VARCHAR(50) NOT NULL
);

INSERT INTO Channels (ChannelName)
VALUES
('ATM'),
('POS'),
('Mobile Banking'),
('Internet Banking'),
('USSD'),
('Transfer'),
('Branch');