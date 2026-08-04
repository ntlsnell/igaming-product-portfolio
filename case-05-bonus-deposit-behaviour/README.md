# Case 05 — Bonus & Deposit Behaviour Analysis
## ✨ Dashboard
[![Dashboard Preview](https://github.com/ntlsnell/igaming-product-portfolio/blob/main/case-05-bonus-deposit-behaviour/dashboards/bonus-deposit-behaviour.png?raw=true)](https://public.tableau.com/views/iGamingBonusDepositBehaviourAnalysis/Dashboard1)
🔗 [View Live Interactive Dashboard on Tableau Public](https://public.tableau.com/views/iGamingBonusDepositBehaviourAnalysis/Dashboard1)
## ✨ Business Context
Analysis of what actually drives deposits in a single player's 21-month transaction history (156,672 transactions, February 2024 – November 2025). The original question — "Do bonuses affect player activity?" — got an unexpected answer: the dataset contains exactly one bonus, activated in the first second of account history, making a before/after comparison impossible. The case was reframed around what the data can honestly support: the welcome bonus played no role in the player's journey, and the real monetisation driver is balance-depletion reloads.
## ✨ Methodology Note
- The planned before/after bonus study required multiple bonus events — the data contains only one, granted at the very start of the player's history
- Instead of forcing the original design, the case pivots to deposit trigger analysis: each of 219 deposits is classified by the player's state at the moment of depositing (LAG window function over the previous transaction)
- A recursive calendar CTE keeps zero-deposit months visible on the timeline instead of silently dropping them
## ✨ Key Insights
- **The welcome bonus failed completely** — one $50 Starter Package, activated on day 1, expired 7 days later; the bonus wallet generated just 42 of 124,869 bets (0.03% of all betting activity)
- **52.5% of deposits happen at a busted balance (< $1)** — the player reloads to continue playing, not proactively
- **26% of deposits are consecutive top-ups** — the previous deposit wasn't enough, so the player immediately deposits again
- **96.8% of deposits convert to a bet within 5 minutes** — 46.1% within the first minute; deposited money goes straight into play
- **Betting intensity jumps 4.4× after a deposit** — from an average of 66 bets in the hour before to 294 bets in the hour after
- **Deposit volume is declining** — 2024 months sit mostly above the monthly average, 2025 months mostly below; combined with Case 03's finding ($20K in withdrawals), the player shifted to self-funding from winnings
- **219 deposits totalling $4,635 over 21 months** — average deposit $21.16, remarkably consistent sizing ($15–$100 range)
## ✨ Tools Used
- SQL (SQLite) — window functions (LAG), recursive calendar CTE, event classification
- Tableau Public — interactive dashboard with 4 visualizations
- GitHub — version control and portfolio hosting
## ✨ SQL Queries
- [Welcome Bonus Lifecycle](sql/01_bonus_lifecycle.sql)
- [Deposit Triggers Classification](sql/02_deposit_triggers.sql)
- [Deposit-to-Play Response](sql/03_deposit_response.sql)
- [Monthly Deposit Dynamics](sql/04_deposit_dynamics.sql)
## ✨ Visualizations
1. Monthly Deposit Dynamics — deposit count across the full 22-month calendar with average reference line, zero-deposit months included
2. What Triggers a Deposit? — horizontal bar chart classifying the player's state at each deposit moment
3. Time to First Bet — distribution of time from deposit to the first stake
4. Bonus Wallet vs Cash Wallet — the 0.03% story: bonus contribution to total betting activity
## ✨ Dataset
Source: Online Gaming Platform Transaction History (same dataset as Case 03)
Records: 156,672 transactions | 1 player | February 2024 – November 2025 | CAD currency
