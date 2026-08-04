-- ============================================================
-- Case 05 — Bonus & Deposit Behaviour Analysis
-- Query 02: Deposit Triggers — player state at deposit moment
-- Output:   2_case_5.csv
-- ============================================================
-- For each of 219 deposits, looks at the PREVIOUS transaction
-- (LAG window function) to classify what triggered the deposit.
--
-- Verified results:
--   1. Busted balance (< $1)        115 deposits  52.5%
--   2. Mid-play reload ($1+)          3 deposits   1.4%
--   3. After withdrawal/payment      43 deposits  19.6%
--   4. Consecutive top-up            57 deposits  26.0%
--   0. First deposit                  1 deposit    0.5%
--
-- Key insight: deposits are play-continuation events — the
-- player reloads when the balance is busted, not proactively.
-- ============================================================

WITH ordered AS (
    SELECT
        datetime,
        category,
        type,
        amount,
        LAG(end_balance) OVER (ORDER BY datetime, rowid) AS balance_before,
        LAG(category)    OVER (ORDER BY datetime, rowid) AS prev_category,
        LAG(type)        OVER (ORDER BY datetime, rowid) AS prev_type
    FROM "Transaction-Report_20251114-expanded"
)

SELECT
    CASE
        WHEN prev_category IS NULL           THEN '0. First deposit'
        WHEN prev_type = 'Deposit'           THEN '4. Consecutive top-up'
        WHEN prev_category = 'Banking'       THEN '3. After withdrawal/payment'
        WHEN COALESCE(balance_before, 0) < 1 THEN '1. Busted balance (< $1)'
        ELSE                                      '2. Mid-play reload ($1+)'
    END AS deposit_trigger,
    COUNT(*)                                            AS deposits,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1)  AS pct_of_deposits,
    ROUND(AVG(amount), 2)                               AS avg_deposit,
    ROUND(SUM(amount), 2)                               AS total_deposited

FROM ordered
WHERE category = 'Banking' AND type = 'Deposit'
GROUP BY 1
ORDER BY 1;
