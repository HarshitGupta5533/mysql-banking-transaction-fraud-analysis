-- 1. Customer account summary
SELECT c.customer_name, a.account_type, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id;

-- 2. Daily transaction total
SELECT DATE(transaction_date) AS trans_date,
       SUM(amount) AS total_amount
FROM transactions
GROUP BY DATE(transaction_date);

-- 3. High-value transactions (>50000)
SELECT *
FROM transactions
WHERE amount > 50000;

-- 4. Detect multiple transactions within same hour
SELECT account_id, COUNT(*) AS txn_count
FROM transactions
GROUP BY account_id, HOUR(transaction_date)
HAVING COUNT(*) > 1;

-- 5. Customers with active loans
SELECT DISTINCT c.customer_name, l.loan_type, l.loan_amount
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
WHERE l.status = 'Active';

-- 6. Loan payment history
SELECT l.loan_type, lp.payment_amount, lp.payment_date
FROM loans l
JOIN loan_payments lp ON l.loan_id = lp.loan_id;

-- 7. Card linked with accounts
SELECT a.account_id, c.card_type, c.status
FROM accounts a
JOIN cards c ON a.account_id = c.account_id;

-- 8. Fraud alert details
SELECT t.transaction_id, t.amount, f.alert_reason
FROM fraud_alerts f
JOIN transactions t ON f.transaction_id = t.transaction_id;

-- 9. Create VIEW for suspicious transactions
CREATE VIEW suspicious_transactions AS
SELECT *
FROM transactions
WHERE amount > 50000;

-- 10. Branch-wise total balance
SELECT b.branch_name, SUM(a.balance) AS total_balance
FROM branches b
JOIN accounts a ON b.branch_id = a.branch_id
GROUP BY b.branch_name;
