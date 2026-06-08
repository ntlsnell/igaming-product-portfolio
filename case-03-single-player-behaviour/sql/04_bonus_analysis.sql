-- Bonus efficiency analysis
-- Key finding: starter bonus $50 almost entirely expired ($0.84 used)

SELECT
    description AS bonus_name,
    COUNT(CASE WHEN type = 'Activated' THEN 1 END) AS times_activated,
    ROUND(SUM(CASE WHEN type = 'Activated' THEN amount ELSE 0 END), 2) AS total_activated,
    COUNT(CASE WHEN type = 'Expired' THEN 1 END) AS times_expired,
    ROUND(SUM(CASE WHEN type = 'Expired' THEN ABS(amount) ELSE 0 END), 2) AS total_expired,
    COUNT(CASE WHEN type = 'Purchase' THEN 1 END) AS times_used,
    ROUND(SUM(CASE WHEN type = 'Purchase' THEN ABS(amount) ELSE 0 END), 2) AS total_used
FROM "Transaction-Report_20251114-expanded"
WHERE category = 'Bonus'
GROUP BY description
ORDER BY total_activated DESC
LIMIT 20;
