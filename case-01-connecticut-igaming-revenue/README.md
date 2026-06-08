# Case 01 — Connecticut iGaming Revenue Analysis 2021–2024

## ✨ Dashboard
[![Dashboard Preview](https://github.com/ntlsnell/igaming-product-portfolio/blob/main/case-01-connecticut-igaming-revenue/dashboards/connecticut-igaming-revenue.png?raw=true)](https://public.tableau.com/views/ConnecticutiGamingRevenueAnalysis20212024/Dashboard1)

🔗 [View Live Interactive Dashboard on Tableau Public](https://public.tableau.com/views/ConnecticutiGamingRevenueAnalysis20212024/Dashboard1)

## ✨ Business Context
Analysis of Connecticut's regulated online casino gaming market from October 2021 to November 2024. Using official state regulatory data, this case tracks GGR growth, licensee market share, and state tax payments across 4 licensed operators — providing a real-world view of a regulated iGaming market from launch to maturity.

## ✨ Key Insights
- **Market grew 3x in 3 years**: GGR increased from $142M (2021/22) to $400M (2023/24)
- **Duopoly market**: MPI Master Wagering (55.71%) and Mohegan Digital (44.04%) control 99.75% of the market
- **Holiday season effect**: Both operators peak in November-December — MPI reached $58M GGR in November
- **GGR margin improving**: House edge grew from 2.24% to 2.85% — operators becoming more efficient
- **Stable tax rate**: All licensees pay exactly 18% of GGR to the State of Connecticut
- **State earned $181M+** in tax payments over 3 full fiscal years

## ✨ Tools Used
- SQL (SQLite) — revenue aggregation and licensee performance analysis
- Tableau Public — interactive dashboard with 4 visualizations
- GitHub — version control and portfolio hosting

## ✨ SQL Queries
- [Revenue Overview by Fiscal Year](sql/01_revenue_overview.sql)
- [Licensee Performance & Market Share](sql/02_licensee_performance.sql)
- [Monthly GGR Trends](sql/03_monthly_trends.sql)
- [State Payment Analysis](sql/04_state_payments.sql)

## ✨ Visualizations
1. GGR Growth by Fiscal Year — market size growth 2021–2024
2. State Payments to Connecticut by Fiscal Year — tax revenue by licensee
3. Market Share by Licensee — duopoly structure
4. Monthly GGR Trend — seasonality and holiday effect

## ✨ Dataset
Source: [Casino Gaming Data — Kaggle](https://www.kaggle.com/datasets/willianoliveiragibin/casino-gaming-data)
Records: 142 monthly records | 4 licensees | October 2021 – November 2024
Original data: Connecticut Department of Consumer Protection — Official Online Casino Gaming Reports
