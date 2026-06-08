-- Overall GGR and Wagers by Fiscal Year
-- Shows market growth from launch (Oct 2021) to present

SELECT
    "Fiscal Year",
    ROUND(SUM("Wagers"), 0) AS total_wagers,
    ROUND(SUM("Patron Winnings"), 0) AS total_patron_winnings,
    ROUND(SUM("Total Gross Gaming Revenue"), 0) AS total_ggr,
    ROUND(SUM("Payment (5)"), 0) AS total_state_payments,
    ROUND(SUM("Total Gross Gaming Revenue") * 100.0 / SUM("Wagers"), 2) AS ggr_margin_pct,
    COUNT(DISTINCT "Licensee") AS active_licensees
FROM "Casino_Gaming_Data new"
GROUP BY "Fiscal Year"
ORDER BY "Fiscal Year";
