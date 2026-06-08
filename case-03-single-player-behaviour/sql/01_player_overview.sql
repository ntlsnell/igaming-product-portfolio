-- Overall player financial summary
-- Deposits, stakes, wins, withdrawals and net P&L

SELECT
    COUNT(*) AS total_transactions,
    ROUND(SUM(CASE WHEN type = 'Deposit' THEN amount ELSE 0 END), 2) AS total_deposits,
    ROUND(SUM(CASE WHEN type = 'Withdrawal' THEN ABS(amount) ELSE 0 END), 2) AS total_withdrawals,
    ROUND(SUM(CASE WHEN type = 'Stake' THEN ABS(amount) ELSE 0 END), 2) AS total_staked,
    ROUND(SUM(CASE WHEN type = 'Win' THEN amount ELSE 0 END), 2) AS total_wins,
    ROUND(SUM(CASE WHEN type = 'Win' THEN amount ELSE 0 END) - 
          SUM(CASE WHEN type = 'Stake' THEN ABS(amount) ELSE 0 END), 2) AS net_gaming_pl,
    ROUND(SUM(CASE WHEN category = 'Bonus' AND type = 'Activated' THEN amount ELSE 0 END), 2) AS total_bonuses_activated,
    COUNT(DISTINCT session_id) AS total_sessions,
    COUNT(DISTINCT DATE(datetime)) AS active_days,
    MIN(DATE(datetime)) AS first_activity,
    MAX(DATE(datetime)) AS last_activity
FROM "Transaction-Report_20251114-expanded";
