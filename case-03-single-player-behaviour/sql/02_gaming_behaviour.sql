-- Top 20 games by total staked with win rate
-- Key finding: Devilish Fortunes most played, Fortune Coin Boost Classic best ROI

SELECT
    description AS game,
    COUNT(CASE WHEN type = 'Stake' THEN 1 END) AS total_bets,
    ROUND(SUM(CASE WHEN type = 'Stake' THEN ABS(amount) ELSE 0 END), 2) AS total_staked,
    ROUND(SUM(CASE WHEN type = 'Win' THEN amount ELSE 0 END), 2) AS total_won,
    ROUND(SUM(CASE WHEN type = 'Win' THEN amount ELSE 0 END) - 
          SUM(CASE WHEN type = 'Stake' THEN ABS(amount) ELSE 0 END), 2) AS net_pl,
    ROUND(SUM(CASE WHEN type = 'Win' THEN amount ELSE 0 END) * 100.0 /
          NULLIF(SUM(CASE WHEN type = 'Stake' THEN ABS(amount) ELSE 0 END), 0), 2) AS return_pct
FROM "Transaction-Report_20251114-expanded"
WHERE category = 'Gaming'
GROUP BY description
ORDER BY total_staked DESC
LIMIT 20;
