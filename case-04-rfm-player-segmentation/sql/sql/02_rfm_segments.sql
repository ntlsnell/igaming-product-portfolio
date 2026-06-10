-- RFM segments based on combined scores
SELECT
    PlayerID,
    Age,
    Gender,
    Location,
    GameGenre,
    SessionsPerWeek,
    PlayerLevel,
    InGamePurchases,
    EngagementLevel,
    r_score,
    f_score,
    m_score,
    (r_score + f_score + m_score) AS rfm_total,
    CASE
        WHEN (r_score + f_score + m_score) >= 8 THEN '1. Champions'
        WHEN (r_score + f_score + m_score) >= 6 THEN '2. Loyal Players'
        WHEN (r_score + f_score + m_score) >= 4 THEN '3. At Risk'
        ELSE '4. Lost Players'
    END AS rfm_segment
FROM (
    SELECT
        PlayerID, Age, Gender, Location, GameGenre,
        SessionsPerWeek, PlayTimeHours, PlayerLevel,
        InGamePurchases, EngagementLevel,
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
        END AS m_score
    FROM "online_gaming_behavior_dataset"
);
