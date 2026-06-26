# Business Rules

## Customer

- A customer belongs to one branch.
- A customer can own one or more accounts.
- A customer may have zero or more loans.

---

## Branch

- A branch can serve many customers.
- Every branch has one manager.

---

## Account

- Every account belongs to one customer.
- Every account has a unique account number.
- Every account can have many transactions.

---

## Transaction

- Every transaction belongs to one account.
- Transactions are either Credit or Debit.

---

## Loan

- A customer can have multiple loans.
- Every loan has one status:
  - Active
  - Closed
  - Defaulted