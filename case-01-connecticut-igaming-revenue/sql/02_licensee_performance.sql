-- Licensee comparison by GGR and market share
-- Key finding: MPI (55.71%) and Mohegan Digital (44.04%) control 99.75% of market

SELECT
    "Licensee",
    ROUND(SUM("Wagers"), 0) AS total_wagers,
    ROUND(SUM("Total Gross Gaming Revenue"), 0) AS total_ggr,
    ROUND(SUM("Payment (5)"), 0) AS total_state_payments,
    ROUND(SUM("Total Gross Gaming Revenue") * 100.0 / 
        (SELECT SUM("Total Gross Gaming Revenue") 
         FROM "Casino_Gaming_Data new"
         WHERE "Total Gross Gaming Revenue" > 0), 2) AS market_share_pct,
    ROUND(AVG("Total Gross Gaming Revenue"), 0) AS avg_monthly_ggr,
    COUNT(*) AS months_active
FROM "Casino_Gaming_Data new"
WHERE "Total Gross Gaming Revenue" > 0
GROUP BY "Licensee"
ORDER BY total_ggr DESC;
