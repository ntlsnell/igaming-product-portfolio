-- Monthly GGR trends by licensee
-- Shows seasonality and holiday season peak effect

SELECT
    "Fiscal Year",
    SUBSTR("Month Ending", 1, 2) || '/' || SUBSTR("Month Ending", 7, 4) AS month_year,
    "Licensee",
    ROUND(SUM("Wagers"), 0) AS total_wagers,
    ROUND(SUM("Total Gross Gaming Revenue"), 0) AS total_ggr,
    ROUND(SUM("Payment (5)"), 0) AS state_payment
FROM "Casino_Gaming_Data new"
WHERE "Total Gross Gaming Revenue" > 0
GROUP BY "Fiscal Year", month_year, "Licensee"
ORDER BY "Fiscal Year", month_year;
