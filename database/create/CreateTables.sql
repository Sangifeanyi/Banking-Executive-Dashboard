USE BankingDashboard;
GO

/*============================================================
  Drop Tables (for development only)
============================================================*/

IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL
    DROP TABLE dbo.Transactions;

IF OBJECT_ID('dbo.Loans', 'U') IS NOT NULL
    DROP TABLE dbo.Loans;

IF OBJECT_ID('dbo.Accounts', 'U') IS NOT NULL
    DROP TABLE dbo.Accounts;

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;

IF OBJECT_ID('dbo.Branches', 'U') IS NOT NULL
    DROP TABLE dbo.Branches;

GO

/*============================================================
  Branches
============================================================*/

CREATE TABLE dbo.Branches
(
    BranchID        INT IDENTITY(1,1) PRIMARY KEY,
    BranchCode      VARCHAR(10) NOT NULL UNIQUE,
    BranchName      VARCHAR(100) NOT NULL,
    State           VARCHAR(50) NOT NULL,
    City            VARCHAR(50),
    ManagerName     VARCHAR(100),
    OpenDate        DATE,
    Status          VARCHAR(20) DEFAULT 'Active'
);

GO

/*============================================================
  Customers
============================================================*/

CREATE TABLE dbo.Customers
(
    CustomerID          INT IDENTITY(100001,1) PRIMARY KEY,
    FirstName           VARCHAR(50) NOT NULL,
    LastName            VARCHAR(50) NOT NULL,
    Gender              CHAR(1) CHECK (Gender IN ('M','F')),
    DateOfBirth         DATE,
    PhoneNumber         VARCHAR(20),
    Email               VARCHAR(100),
    Occupation          VARCHAR(100),
    MonthlyIncome       DECIMAL(18,2),
    CustomerSince       DATE,
    BranchID            INT NOT NULL,
    CustomerStatus      VARCHAR(20) DEFAULT 'Active',

    CONSTRAINT FK_Customers_Branches
        FOREIGN KEY (BranchID)
        REFERENCES dbo.Branches(BranchID)
);

GO

/*============================================================
  Accounts
============================================================*/

CREATE TABLE dbo.Accounts
(
    AccountID           INT IDENTITY(1000001,1) PRIMARY KEY,
    AccountNumber       VARCHAR(20) UNIQUE NOT NULL,
    CustomerID          INT NOT NULL,
    AccountType         VARCHAR(30) NOT NULL,
    Balance             DECIMAL(18,2) DEFAULT 0,
    CurrencyCode        CHAR(3) DEFAULT 'NGN',
    OpenDate            DATE,
    AccountStatus       VARCHAR(20) DEFAULT 'Active',

    CONSTRAINT FK_Accounts_Customers
        FOREIGN KEY(CustomerID)
        REFERENCES dbo.Customers(CustomerID)
);

GO

/*============================================================
  Loans
============================================================*/

CREATE TABLE dbo.Loans
(
    LoanID              INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID          INT NOT NULL,
    LoanType            VARCHAR(50),
    LoanAmount          DECIMAL(18,2),
    InterestRate        DECIMAL(5,2),
    LoanTermMonths      INT,
    StartDate           DATE,
    EndDate             DATE,
    OutstandingBalance  DECIMAL(18,2),
    LoanStatus          VARCHAR(30),

    CONSTRAINT FK_Loans_Customers
        FOREIGN KEY(CustomerID)
        REFERENCES dbo.Customers(CustomerID)
);

GO

/*============================================================
  Transactions
============================================================*/

CREATE TABLE dbo.Transactions
(
    TransactionID       BIGINT IDENTITY(1,1) PRIMARY KEY,
    AccountID           INT NOT NULL,
    TransactionDate     DATETIME NOT NULL,
    TransactionType     VARCHAR(20),
    Amount              DECIMAL(18,2),
    Channel             VARCHAR(30),
    Description         VARCHAR(200),

    CONSTRAINT FK_Transactions_Accounts
        FOREIGN KEY(AccountID)
        REFERENCES dbo.Accounts(AccountID)
);

GO

/*============================================================
  Helpful Indexes
============================================================*/

CREATE INDEX IX_Customers_Branch
ON dbo.Customers(BranchID);

CREATE INDEX IX_Accounts_Customer
ON dbo.Accounts(CustomerID);

CREATE INDEX IX_Loans_Customer
ON dbo.Loans(CustomerID);

CREATE INDEX IX_Transactions_Account
ON dbo.Transactions(AccountID);

CREATE INDEX IX_Transactions_Date
ON dbo.Transactions(TransactionDate);

GO