CREATE DATABASE banking_db;
USE banking_db;

-- 1. Customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    dob DATE,
    city VARCHAR(30),
    phone VARCHAR(15)
);

-- 2. Branches
CREATE TABLE branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50),
    city VARCHAR(30)
);

-- 3. Employees
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    branch_id INT,
    designation VARCHAR(30),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- 4. Accounts
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    open_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- 5. Transactions
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATETIME,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- 6. Loans
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(12,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 7. Loan Payments
CREATE TABLE loan_payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

-- 8. Cards
CREATE TABLE cards (
    card_id INT PRIMARY KEY,
    account_id INT,
    card_type VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- 9. Fraud Alerts
CREATE TABLE fraud_alerts (
    alert_id INT PRIMARY KEY,
    transaction_id INT,
    alert_reason VARCHAR(100),
    alert_date DATE,
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id)
);

-- 10. Audit Logs
CREATE TABLE audit_logs (
    log_id INT PRIMARY KEY,
    action VARCHAR(100),
    action_date DATETIME
);
