-- Segment profiles with key metrics
SELECT
    rfm_segment,
    COUNT(*) AS total_players,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_of_total,
    ROUND(AVG(SessionsPerWeek), 2) AS avg_sessions,
    ROUND(AVG(PlayTimeHours), 2) AS avg_playtime,
    ROUND(AVG(PlayerLevel), 2) AS avg_level,
    ROUND(AVG(InGamePurchases) * 100, 2) AS purchase_rate_pct,
    ROUND(AVG(Age), 1) AS avg_age,
    ROUND(AVG(rfm_total), 2) AS avg_rfm_score
FROM (
    SELECT
        PlayerID, Age, SessionsPerWeek, PlayTimeHours,
        PlayerLevel, InGamePurchases,
        CASE EngagementLevel
            WHEN 'High' THEN 3
            WHEN 'Medium' THEN 2
            WHEN 'Low' THEN 1
        END AS r_score,
        CASE
            WHEN SessionsPerWeek >= 10 THEN 3
            WHEN SessionsPerWeek >= 4 THEN 2
            ELSE 1
        END AS f_score,
        CASE
            WHEN PlayerLevel >= 67 AND InGamePurchases = 1 THEN 3
            WHEN PlayerLevel >= 33 THEN 2
            ELSE 1
        END AS m_score,
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
        END AS rfm_segment,
        (CASE EngagementLevel WHEN 'High' THEN 3 WHEN 'Medium' THEN 2 ELSE 1 END +
         CASE WHEN SessionsPerWeek >= 10 THEN 3 WHEN SessionsPerWeek >= 4 THEN 2 ELSE 1 END +
         CASE WHEN PlayerLevel >= 67 AND InGamePurchases = 1 THEN 3 WHEN PlayerLevel >= 33 THEN 2 ELSE 1 END) AS rfm_total
    FROM "online_gaming_behavior_dataset"
)
GROUP BY rfm_segment
ORDER BY rfm_segment;
