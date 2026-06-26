# Entity Relationship Diagram

```text
                 Branches
                 --------
                 BranchID (PK)
                 BranchCode
                 BranchName
                 State
                 City
                 ManagerName
                      │
                      │ 1
                      │
                      │
                 ∞ Customers
                 ----------
                 CustomerID (PK)
                 BranchID (FK)
                 FirstName
                 LastName
                 Gender
                 DateOfBirth
                 Occupation
                 MonthlyIncome
                      │
          ┌───────────┴────────────┐
          │                        │
          │                        │
          │                        │
     ∞ Accounts                ∞ Loans
     -----------               --------
     AccountID (PK)            LoanID (PK)
     CustomerID (FK)           CustomerID (FK)
     AccountNumber             LoanType
     Balance                   LoanAmount
                               LoanStatus
          │
          │1
          │
          │
     ∞ Transactions
     ----------------
     TransactionID (PK)
     AccountID (FK)
     TransactionDate
     TransactionType
     Amount
     Channel
```