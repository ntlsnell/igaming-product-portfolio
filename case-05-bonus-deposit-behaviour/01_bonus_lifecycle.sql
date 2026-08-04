-- ============================================================
-- Case 05 — Bonus & Deposit Behaviour Analysis
-- Query 01: Welcome Bonus Lifecycle
-- Output:   1_case_5.csv (run QUERY B for the export)
-- ============================================================
-- Verified results:
--   The player received exactly ONE bonus in 21 months:
--   Starter Package $50 — activated 2024-02-01 (first second
--   of account history), expired 2024-02-08 with $0.84 unused.
--   Bonus (Casino) wallet generated only 42 of 124,869 stakes
--   (0.03% of all betting activity).
-- ============================================================
-- NOTE: adjust the table name if yours differs.
-- Run each query separately in DB Browser (highlight + Ctrl/Cmd+Enter).

-- ------------------------------------------------------------
-- QUERY A — Bonus lifecycle events (2 rows)
-- ------------------------------------------------------------
SELECT
    datetime,
    type,
    description,
    wallet,
    amount
FROM "Transaction-Report_20251114-expanded"
WHERE category = 'Bonus'
ORDER BY datetime;

-- ------------------------------------------------------------
-- QUERY B — Gaming activity by wallet: Cash vs Casino (bonus)
-- Expected: Cash 124,827 stakes / $27,741.28 staked
--           Casino     42 stakes / $61.10 staked
-- ------------------------------------------------------------
SELECT
    wallet,
    SUM(CASE WHEN type = 'Stake' THEN 1 ELSE 0 END)                  AS total_bets,
    ROUND(SUM(CASE WHEN type = 'Stake' THEN -amount ELSE 0 END), 2)  AS total_staked,
    ROUND(SUM(CASE WHEN type = 'Win'   THEN amount ELSE 0 END), 2)   AS total_won,
    ROUND(SUM(amount), 2)                                            AS net_result
FROM "Transaction-Report_20251114-expanded"
WHERE category = 'Gaming'
GROUP BY wallet
ORDER BY total_bets DESC;
