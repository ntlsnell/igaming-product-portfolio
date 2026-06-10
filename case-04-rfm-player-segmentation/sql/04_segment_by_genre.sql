-- Segment distribution by game genre
SELECT
    rfm_segment,
    GameGenre,
    COUNT(*) AS total_players,
    ROUND(AVG(SessionsPerWeek), 2) AS avg_sessions,
    ROUND(AVG(InGamePurchases) * 100, 2) AS purchase_rate_pct
FROM (
    SELECT
        GameGenre,
        SessionsPerWeek,
        InGamePurchases,
        CASE
            WHEN (CASE EngagementLevel WHEN 'High' THEN 3 WHEN 'Medium' THEN 2 ELSE 1 END +
                  CASE WHEN SessionsPerWeek >= 10 THEN 3 WHEN SessionsPerWeek >= 4 THEN 2 ELSE 1 END +
                  CASE WHEN PlayerLevel >= 67 AND InGamePurchases = 1 THEN 3 WHEN PlayerLevel >= 33 THEN 2 ELSE 1 END) >= 8 THEN '1. Champions'
            WHEN (CASE EngagementLevel WHEN 'High' THEN 3 WHEN 'Medium' THEN 2 ELSE 1 END +
                  CASE WHEN SessionsPerWeek >= 10 THEN 3 WHEN SessionsPerWeek >= 4 THEN 2 ELSE 1 END +
                  CASE WHEN PlayerLevel >= 67 AND InGamePurchases = 1 THEN 3 WHEN PlayerLevel >= 33 THEN 2 ELSE 1 END) >= 6 THEN '2. Loyal Players'
            WHEN (CASE EngagementLevel WHEN 'High' THEN 3 WHEN 'Medium' THEN 2 ELSE 1 END +
                  CASE WHEN SessionsPerWeek >= 10 THEN 3 WHEN SessionsPerWeek >= 4 THEN 2 ELSE 1 END +
                  CASE WHEN PlayerLevel >= 67 AND InGamePurchases = 1 THEN 3 WHEN PlayerLevel >= 33 THEN 2 ELSE 1 END) >= 4 THEN '3. At Risk'
            ELSE '4. Lost Players'
        END AS rfm_segment
    FROM "online_gaming_behavior_dataset"
)
GROUP BY rfm_segment, GameGenre
ORDER BY rfm_segment, total_players DESC;
