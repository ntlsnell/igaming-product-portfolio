-- State payment analysis vs GGR
-- Key finding: stable 18% tax rate across all licensees and fiscal years

SELECT
    "Licensee",
    "Fiscal Year",
    ROUND(SUM("Total Gross Gaming Revenue"), 0) AS total_ggr,
    ROUND(SUM("Payment (5)"), 0) AS total_state_payments,
    ROUND(SUM("Payment (5)") * 100.0 / 
        NULLIF(SUM("Total Gross Gaming Revenue"), 0), 2) AS effective_tax_rate_pct,
    ROUND(AVG("Payment (5)"), 0) AS avg_monthly_payment
FROM "Casino_Gaming_Data new"
WHERE "Total Gross Gaming Revenue" > 0
GROUP BY "Licensee", "Fiscal Year"
ORDER BY "Licensee", "Fiscal Year";
