## Customers

Stores demographic and financial profile of every banking customer.

### Primary Key
- CustomerID

### Foreign Keys
- BranchID
- EducationID
- MaritalStatusID
- SegmentID

### Business Rules
- One customer belongs to one home branch.
- One customer belongs to one customer segment.
- Monthly income is generated based on occupation.
- Annual income = MonthlyIncome × 12.
- RiskScore is used for loan eligibility and credit analysis.