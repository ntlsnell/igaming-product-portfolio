-- Churn rate by activity tier (sessions per week buckets)
-- Key finding: Low activity = 74.54% churn vs High activity = 8.6%

SELECT
    CASE
        WHEN SessionsPerWeek BETWEEN 0 AND 3 THEN '1. Low (0-3)'
        WHEN SessionsPerWeek BETWEEN 4 AND 9 THEN '2. Medium (4-9)'
        WHEN SessionsPerWeek BETWEEN 10 AND 19 THEN '3. High (10-19)'
    END AS activity_tier,
    COUNT(*) AS total_players,
    SUM(CASE WHEN EngagementLevel = 'Low' THEN 1 ELSE 0 END) AS churned_players,
    ROUND(SUM(CASE WHEN EngagementLevel = 'Low' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct,
    ROUND(AVG(PlayTimeHours), 2) AS avg_playtime,
    ROUND(AVG(PlayerLevel), 2) AS avg_player_level
FROM "online_gaming_behavior_dataset"
GROUP BY activity_tier
ORDER BY activity_tier;
