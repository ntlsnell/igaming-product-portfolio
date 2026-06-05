-- Overall churn rate and engagement distribution
-- Shows player split across High/Medium/Low engagement levels

SELECT
    EngagementLevel,
    COUNT(*) AS total_players,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_of_total,
    ROUND(AVG(SessionsPerWeek), 2) AS avg_sessions,
    ROUND(AVG(PlayTimeHours), 2) AS avg_playtime,
    ROUND(AVG(AvgSessionDurationMinutes), 2) AS avg_session_duration,
    ROUND(AVG(PlayerLevel), 2) AS avg_player_level
FROM "online_gaming_behavior_dataset"
GROUP BY EngagementLevel
ORDER BY total_players DESC;
