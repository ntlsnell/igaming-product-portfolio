# Case 04 — RFM Player Segmentation
## ✨ Dashboard
[![Dashboard Preview](https://github.com/ntlsnell/igaming-product-portfolio/blob/main/case-04-rfm-player-segmentation/dashboards/rfm-player-segmentation.png?raw=true)](https://public.tableau.com/views/iGamingRFMPlayerSegmentation40KPlayers/Dashboard1)
🔗 [View Live Interactive Dashboard on Tableau Public](https://public.tableau.com/views/iGamingRFMPlayerSegmentation40KPlayers/Dashboard1)
## ✨ Business Context
RFM segmentation of 40,034 players from an online gaming platform — identifying high-value players, retention risks, and win-back opportunities. Classic RFM methodology adapted to gaming behaviour data: engagement level as Recency, session frequency as Frequency, and player level combined with in-game purchases as Monetary. Players are scored 1–3 on each dimension and grouped into 4 actionable segments.
## ✨ RFM Methodology
- **R (Recency)** → EngagementLevel: High = 3, Medium = 2, Low = 1
- **F (Frequency)** → SessionsPerWeek: ≥10 = 3, ≥4 = 2, else = 1
- **M (Monetary)** → PlayerLevel + InGamePurchases: Level ≥67 & Purchase = 3, Level ≥33 = 2, else = 1
- **Segments by total score**: Champions ≥8 | Loyal Players 6–7 | At Risk 4–5 | Lost Players ≤3
## ✨ Key Insights
- **Champions — 6,990 players (17.46%)** — 14.99 sessions/week and 27.97% purchase rate, nearly 1.5× the base average
- **Loyal Players — 19,533 players (48.79%)** — almost half the base sits one step below Champions, the core upsell opportunity
- **At Risk — 11,388 players (28.45%)** — only 4.47 sessions/week, prime target for re-engagement before sliding into Lost
- **Lost Players' purchase rate (19.55%) is higher than At Risk (17.39%)** — these players paid but stopped playing, strong win-back potential
- **Geography does not predict player value** — segment shares vary by less than 1.5 p.p. across Asia, Europe, USA and Other
- **Genre mix is nearly identical across segments** — player value is driven by behavioural frequency, not game preference
## ✨ Tools Used
- SQL (SQLite) — RFM scoring, segmentation, segment profiling
- Tableau Public — interactive dashboard with 4 visualizations
- GitHub — version control and portfolio hosting
## ✨ SQL Queries
- [RFM Scores Calculation](sql/01_rfm_scores.sql)
- [RFM Segments Assignment](sql/02_rfm_segments.sql)
- [Segment Profile Aggregation](sql/03_segment_profile.sql)
- [Segments by Game Genre](sql/04_segment_by_genre.sql)
## ✨ Visualizations
1. Player Distribution by Segment & Session Frequency — stacked bar chart, session activity 0–19 coloured by segment
2. Segment Profile — Sessions & Purchase Rate — bar chart with purchase rate in tooltip
3. Segment Distribution by Location — 100% stacked bar across Asia, Europe, USA, Other
4. Segment Distribution by Game Genre — treemap sized by player count, coloured by segment
## ✨ Dataset
Source: [Predict Online Gaming Behavior Dataset — Kaggle](https://www.kaggle.com/datasets/rabieelkharoua/predict-online-gaming-behavior-dataset)
Records: 40,034 players | 13 columns | 4 RFM segments
