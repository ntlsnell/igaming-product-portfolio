-- Gaming activity by hour and day of week
-- Key finding: peak activity late night (0-2 AM) and weekends

SELECT
    CASE CAST(strftime('%w', datetime) AS INTEGER)
        WHEN 0 THEN '7. Sunday'
        WHEN 1 THEN '1. Monday'
        WHEN 2 THEN '2. Tuesday'
        WHEN 3 THEN '3. Wednesday'
        WHEN 4 THEN '4. Thursday'
        WHEN 5 THEN '5. Friday'
        WHEN 6 THEN '6. Saturday'
    END AS day_of_week,
    hour,
    COUNT(DISTINCT session_id) AS total_sessions,
    COUNT(CASE WHEN type = 'Stake' THEN 1 END) AS total_bets,
    ROUND(SUM(CASE WHEN type = 'Stake' THEN ABS(amount) ELSE 0 END), 2) AS total_staked,
    ROUND(SUM(CASE WHEN type = 'Win' THEN amount ELSE 0 END), 2) AS total_won
FROM "Transaction-Report_20251114-expanded"
WHERE category = 'Gaming'
GROUP BY day_of_week, hour
ORDER BY day_of_week, hour;
