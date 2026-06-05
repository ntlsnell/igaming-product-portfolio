# Case 02 — Player Churn & Engagement Analysis

## ✨ Dashboard
[![Dashboard Preview](https://github.com/ntlsnell/igaming-product-portfolio/blob/main/case-02-player-churn-engagement/dashboards/player-churn-engagement.png?raw=true)](https://public.tableau.com/views/iGamingPlayerChurnEngagementAnalysis40KPlayers/Dashboard1)

🔗 [View Live Interactive Dashboard on Tableau Public](https://public.tableau.com/views/iGamingPlayerChurnEngagementAnalysis40KPlayers/Dashboard1)

## ✨ Business Context
Analysis of 40,000+ player records to identify key churn drivers and engagement patterns in an online gaming platform. The goal is to understand which behavioral signals predict player dropout and which demographic factors are irrelevant — enabling data-driven retention strategy.

## ✨ Key Insights
- **Activity is everything**: Low activity players (0-3 sessions/week) churn at 74.54% vs only 8.6% for High activity (10-19 sessions/week)
- **Demographics don't matter**: Age and gender show minimal churn difference (24-27% across all groups) — retention campaigns should not be segmented by demographics
- **Genre doesn't predict churn**: RPG + Easy has highest churn (27.63%) but difference across all genre/difficulty combinations is only ~3pp — not actionable
- **25.79% overall churn rate**: 1 in 4 players is at risk — primary retention lever is session frequency
- **Medium engagement dominates**: 48.39% of players are Medium engagement — largest opportunity for retention uplift

## ✨ Tools Used
- SQL (SQLite) — player segmentation and churn rate analysis
- Tableau Public — interactive dashboard with 4 visualizations
- GitHub — version control and portfolio hosting

## ✨ SQL Queries
- [Churn Overview by Engagement Level](sql/01_churn_overview.sql)
- [Churn Rate by Activity Tier](sql/02_churn_by_activity.sql)
- [Churn Rate by Game Genre & Difficulty](sql/03_churn_by_genre.sql)
- [Player Segments by Age & Gender](sql/04_player_segments.sql)

> Note: Churn is defined as EngagementLevel = 'Low' — the best available proxy in absence of timestamp data.

## ✨ Visualizations
1. Churn Rate by Player Activity Level — key finding: 74.54% vs 8.6%
2. Player Engagement Level Distribution — 48.39% Medium, 25.82% High, 25.79% Low
3. Churn Rate by Game Genre & Difficulty — heatmap across 15 combinations
4. Churn Rate by Age Group & Gender — demographic analysis

## ✨ Dataset
Source: [Predict Online Gaming Behavior Dataset — Kaggle](https://www.kaggle.com/datasets/rabieelkharoua/predict-online-gaming-behavior-dataset)
Records: 40,034 players | 13 variables | Synthetic dataset
