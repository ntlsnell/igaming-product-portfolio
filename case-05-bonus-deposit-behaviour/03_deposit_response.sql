-- ============================================================
-- Case 05 — Bonus & Deposit Behaviour Analysis
-- Query 03: Deposit-to-Play Response
-- Output:   3_case_5.csv (run QUERY A for the export)
-- ============================================================
-- Verified results:
--   QUERY A — time from deposit to first bet:
--     < 1 min      101 deposits  46.1%
--     1-5 min      111 deposits  50.7%   -> 96.8% within 5 min
--     5-30 min       5 deposits   2.3%
--     30min-2h       2 deposits   0.9%
--   QUERY B — betting intensity around deposit:
--     avg 66.1 bets in the hour BEFORE
--     avg 293.6 bets in the hour AFTER  -> 4.4x jump
-- ============================================================
-- Run each query separately in DB Browser.

-- ------------------------------------------------------------
-- QUERY A — Time from deposit to first bet (distribution)
-- ------------------------------------------------------------
WITH deposits AS (
    SELECT datetime AS dep_time
    FROM "Transaction-Report_20251114-expanded"
    WHERE category = 'Banking' AND type = 'Deposit'
),

first_bet AS (
    SELECT
        d.dep_time,
        (SELECT MIN(t.datetime)
         FROM "Transaction-Report_20251114-expanded" t
         WHERE t.type = 'Stake' AND t.datetime > d.dep_time) AS first_stake
    FROM deposits d
)

SELECT
    CASE
        WHEN (julianday(first_stake) - julianday(dep_time)) * 1440 < 1   THEN '1. < 1 min'
        WHEN (julianday(first_stake) - julianday(dep_time)) * 1440 < 5   THEN '2. 1-5 min'
        WHEN (julianday(first_stake) - julianday(dep_time)) * 1440 < 30  THEN '3. 5-30 min'
        WHEN (julianday(first_stake) - julianday(dep_time)) * 1440 < 120 THEN '4. 30 min - 2 h'
        ELSE                                                                  '5. 2 h+'
    END AS time_to_first_bet,
    COUNT(*)                                            AS deposits,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1)  AS pct_of_deposits

FROM first_bet
WHERE first_stake IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- ------------------------------------------------------------
-- QUERY B — Betting intensity: 1 hour before vs 1 hour after
-- ------------------------------------------------------------
WITH deposits AS (
    SELECT datetime AS dep_time
    FROM "Transaction-Report_20251114-expanded"
    WHERE category = 'Banking' AND type = 'Deposit'
)

SELECT
    COUNT(*)                    AS deposits_analyzed,
    ROUND(AVG(bets_before), 1)  AS avg_bets_1h_before,
    ROUND(AVG(bets_after), 1)   AS avg_bets_1h_after,
    ROUND(AVG(bets_after) / AVG(bets_before), 1) AS intensity_multiplier
FROM (
    SELECT
        d.dep_time,
        (SELECT COUNT(*)
         FROM "Transaction-Report_20251114-expanded" t
         WHERE t.type = 'Stake'
           AND t.datetime >= datetime(d.dep_time, '-1 hour')
           AND t.datetime <  d.dep_time)                 AS bets_before,
        (SELECT COUNT(*)
         FROM "Transaction-Report_20251114-expanded" t
         WHERE t.type = 'Stake'
           AND t.datetime >  d.dep_time
           AND t.datetime <= datetime(d.dep_time, '+1 hour')) AS bets_after
    FROM deposits d
);
