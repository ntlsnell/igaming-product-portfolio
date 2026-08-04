-- ============================================================
-- Case 05 — Bonus & Deposit Behaviour Analysis
-- Query 04: Monthly Deposit Dynamics
-- Output:   4_case_5.csv
-- ============================================================
-- Verified results: 219 deposits over 21 months
--   (2024-02 ... 2025-11, only 2025-03 has zero deposits),
--   $4,635 total, avg deposit $21.16 (min $15, max $100).
--
-- !! IMPORTANT SQL TRAP !!
-- This table has its own integer columns hour/day/week/month/
-- quarter/year. Writing "GROUP BY month" silently groups by the
-- TABLE COLUMN (1-12), merging Feb 2024 with Feb 2025.
-- Always use GROUP BY 1 (or a non-colliding alias) here.
-- ============================================================

SELECT
    substr(datetime, 1, 7)        AS deposit_month,   -- 'YYYY-MM'
    COUNT(*)                      AS deposits,
    ROUND(SUM(amount), 2)         AS total_deposited,
    ROUND(AVG(amount), 2)         AS avg_deposit

FROM "Transaction-Report_20251114-expanded"
WHERE category = 'Banking' AND type = 'Deposit'
GROUP BY 1
ORDER BY 1;
