-- Player segmentation by age group and gender
-- Key finding: demographics do NOT predict churn (24-27% across all groups)

SELECT
    CASE
        WHEN Age BETWEEN 15 AND 18 THEN '1. Teen (15-18)'
        WHEN Age BETWEEN 19 AND 25 THEN '2. Young Adult (19-25)'
        WHEN Age BETWEEN 26 AND 35 THEN '3. Adult (26-35)'
        WHEN Age BETWEEN 36 AND 45 THEN '4. Senior (36-45)'
        ELSE '5. Mature (46+)'
    END AS age_segment,
    Gender,
    COUNT(*) AS total_players,
    ROUND(SUM(CASE WHEN EngagementLevel = 'Low' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct,
    ROUND(AVG(SessionsPerWeek), 2) AS avg_sessions,
    ROUND(AVG(InGamePurchases) * 100, 2) AS purchase_rate_pct,
    ROUND(AVG(PlayerLevel), 2) AS avg_level
FROM "online_gaming_behavior_dataset"
GROUP BY age_segment, Gender
ORDER BY age_segment, Gender;
