-- RFM scoring for each player
-- R: Engagement proxy, F: Sessions, M: Purchase + Level

SELECT
    PlayerID,
    Age,
    Gender,
    Location,
    GameGenre,
    SessionsPerWeek,
    PlayTimeHours,
    PlayerLevel,
    InGamePurchases,
    EngagementLevel,
    -- Recency Score (1-3): High=3, Medium=2, Low=1
    CASE EngagementLevel
        WHEN 'High' THEN 3
        WHEN 'Medium' THEN 2
        WHEN 'Low' THEN 1
    END AS r_score,
    -- Frequency Score (1-3): based on sessions per week
    CASE
        WHEN SessionsPerWeek >= 10 THEN 3
        WHEN SessionsPerWeek >= 4 THEN 2
        ELSE 1
    END AS f_score,
    -- Monetary Score (1-3): based on player level + purchases
    CASE
        WHEN PlayerLevel >= 67 AND InGamePurchases = 1 THEN 3
        WHEN PlayerLevel >= 33 THEN 2
        ELSE 1
    END AS m_score
FROM "online_gaming_behavior_dataset";
