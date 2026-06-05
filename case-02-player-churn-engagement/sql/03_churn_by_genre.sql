-- Churn rate by game genre and difficulty
-- Shows churn across all 15 genre/difficulty combinations

SELECT
    GameGenre,
    GameDifficulty,
    COUNT(*) AS total_players,
    SUM(CASE WHEN EngagementLevel = 'Low' THEN 1 ELSE 0 END) AS churned_players,
    ROUND(SUM(CASE WHEN EngagementLevel = 'Low' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct,
    ROUND(AVG(SessionsPerWeek), 2) AS avg_sessions,
    ROUND(AVG(InGamePurchases) * 100, 2) AS purchase_rate_pct
FROM "online_gaming_behavior_dataset"
GROUP BY GameGenre, GameDifficulty
ORDER BY churn_rate_pct DESC;
