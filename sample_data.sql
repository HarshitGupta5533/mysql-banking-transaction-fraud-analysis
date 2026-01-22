-- Customers
INSERT INTO customers VALUES
(1, 'Amit Sharma', '1988-05-12', 'Delhi', '9999999999'),
(2, 'Neha Verma', '1992-09-20', 'Mumbai', '8888888888'),
(3, 'Rohit Gupta', '1985-03-18', 'Pune', '7777777777');

-- Branches
INSERT INTO branches VALUES
(101, 'Connaught Place', 'Delhi'),
(102, 'Andheri', 'Mumbai');

-- Employees
INSERT INTO employees VALUES
(1, 'Suresh Kumar', 101, 'Manager'),
(2, 'Anita Shah', 102, 'Officer');

-- Accounts
INSERT INTO accounts VALUES
(1001, 1, 101, 'Savings', 150000, '2020-01-10'),
(1002, 2, 102, 'Current', 250000, '2019-06-15'),
(1003, 3, 101, 'Savings', 90000, '2021-03-25');

-- Transactions
INSERT INTO transactions VALUES
(1, 1001, 'Debit', 50000, '2024-01-10 10:30:00'),
(2, 1001, 'Debit', 70000, '2024-01-10 11:00:00'),
(3, 1002, 'Credit', 100000, '2024-02-15 09:45:00'),
(4, 1003, 'Debit', 60000, '2024-03-05 14:20:00');

-- Loans
INSERT INTO loans VALUES
(201, 1, 'Home Loan', 3000000, 'Active'),
(202, 2, 'Car Loan', 800000, 'Active');

-- Loan Payments
INSERT INTO loan_payments VALUES
(1, 201, 25000, '2024-01-05'),
(2, 202, 18000, '2024-02-05');

-- Cards
INSERT INTO cards VALUES
(501, 1001, 'Debit Card', 'Active'),
(502, 1002, 'Credit Card', 'Active');

-- Fraud Alerts
INSERT INTO fraud_alerts VALUES
(1, 2, 'Multiple high-value transactions in short time', '2024-01-10');

-- Audit Logs
INSERT INTO audit_logs VALUES
(1, 'High value transaction flagged', '2024-01-10 11:05:00');
