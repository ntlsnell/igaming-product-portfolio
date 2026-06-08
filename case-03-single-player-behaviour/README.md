# Case 03 — Single Player Behaviour Analysis

## ✨ Dashboard
[![Dashboard Preview](https://github.com/ntlsnell/igaming-product-portfolio/blob/main/case-03-single-player-behaviour/dashboards/single-player-behaviour.png?raw=true)](https://public.tableau.com/views/iGamingSinglePlayerBehaviourAnalysis/Dashboard1)

🔗 [View Live Interactive Dashboard on Tableau Public](https://public.tableau.com/views/iGamingSinglePlayerBehaviourAnalysis/Dashboard1)

## ✨ Business Context
Deep-dive analysis of a single player's complete transaction history from an online gaming platform — covering 156,672 transactions across 21 months (February 2024 – November 2025). The analysis tracks gaming behaviour, game preferences, session patterns, and financial performance to understand how a real player interacts with an iGaming platform over time.

## ✨ Key Insights
- **Player deposited $4,635 CAD but withdrew $20,169 CAD** — net positive cashflow despite -$288 net gaming P&L
- **Devilish Fortunes** — most played game: 11,743 bets, $5,323 staked, Net +$12.9 CAD
- **Fortune Coin Boost Classic** — best ROI: $335 staked, $538 won, Net +$203.2 CAD (60% profit)
- **417 gaming sessions** across 163 active days — average 2.5 sessions per active day
- **Peak activity**: late night hours (0-2 AM) and weekends show highest bet volume
- **588 unique games played** — highly exploratory behaviour
- **Starter bonus ($50 CAD)** almost entirely expired — only $0.84 used out of $50 activated

## ✨ Tools Used
- SQL (SQLite) — transaction analysis, session segmentation, game performance
- Tableau Public — interactive dashboard with 4 visualizations
- GitHub — version control and portfolio hosting

## ✨ SQL Queries
- [Player Overview & Financial Summary](sql/01_player_overview.sql)
- [Gaming Behaviour by Game](sql/02_gaming_behaviour.sql)
- [Session Analysis by Day & Hour](sql/03_session_analysis.sql)
- [Bonus Efficiency Analysis](sql/04_bonus_analysis.sql)

## ✨ Visualizations
1. Top 10 Games by Total Staked — most active games with return rate color coding
2. Total Staked vs Total Won by Game — scatter plot with outlier annotations
3. Gaming Activity Heatmap — bet volume by day of week and hour
4. Net P&L by Game — profit/loss breakdown with zero reference line

## ✨ Dataset
Source: [Online Gaming Platform Transaction History — Kaggle](https://www.kaggle.com/)
Records: 156,672 transactions | 1 player | February 2024 – November 2025 | CAD currency
