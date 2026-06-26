# Data Dictionary

## Table: Branches

| Column | Data Type | Description |
|---------|-----------|-------------|
| BranchID | INT | Primary Key |
| BranchCode | VARCHAR(10) | Unique branch code |
| BranchName | VARCHAR(100) | Branch name |
| State | VARCHAR(50) | Nigerian state |
| City | VARCHAR(50) | City |
| ManagerName | VARCHAR(100) | Branch manager |
| OpenDate | DATE | Date opened |
| Status | VARCHAR(20) | Active/Inactive |

---

## Table: Customers

| Column | Data Type | Description |
|---------|-----------|-------------|
| CustomerID | INT | Primary Key |
| BranchID | INT | Foreign Key |
| FirstName | VARCHAR(50) | Customer first name |
| LastName | VARCHAR(50) | Customer surname |
| Gender | CHAR(1) | M/F |
| DateOfBirth | DATE | Date of birth |
| Occupation | VARCHAR(100) | Occupation |
| MonthlyIncome | DECIMAL(18,2) | Monthly income |
| CustomerSince | DATE | Registration date |