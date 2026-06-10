# ✨ Case 04 — RFM Player Segmentation

Segmentation of **40,034 players** using an adapted RFM framework to identify high-value players, retention risks, and win-back opportunities.

---

## 🎯 Business Question

Which players drive the most value, who is about to churn, and where should retention budget go first?

---

## 📊 Dataset

- **Source:** [Online Gaming Behavior Dataset (Kaggle)](https://www.kaggle.com/datasets/rabieelkharoua/predict-online-gaming-behavior-dataset)
- **Size:** 40,034 players × 13 columns
- Demographics, engagement level, session frequency, player level, in-game purchases

---

## 🔢 RFM Methodology

Classic RFM adapted to gaming behavior data:

| Component | Proxy | Scoring |
|---|---|---|
| **R** — Recency | EngagementLevel | High = 3, Medium = 2, Low = 1 |
| **F** — Frequency | SessionsPerWeek | ≥10 = 3, ≥4 = 2, else = 1 |
| **M** — Monetary | PlayerLevel + InGamePurchases | Level ≥67 & Purchase = 3, Level ≥33 = 2, else = 1 |

**Segments by total RFM score:** Champions ≥8 · Loyal Players 6–7 · At Risk 4–5 · Lost Players ≤3

---

## 👥 Segment Profiles

| Segment | Players | Share | Avg Sessions/Week | Purchase Rate |
|---|---|---|---|---|
| 🏆 Champions | 6,990 | 17.46% | 14.99 | 27.97% |
| 🔶 Loyal Players | 19,533 | 48.79% | 11.31 | 18.90% |
| ⚠️ At Risk | 11,388 | 28.45% | 4.47 | 17.39% |
| ⬜ Lost Players | 2,123 | 5.30% | 1.28 | 19.55% |

---

## 💡 Key Insights

- **Champions are 17.5% of the base but purchase at 27.97%** — nearly 1.5× the average. Protecting this segment is the highest-ROI retention play.
- **Almost half the base (48.79%) are Loyal Players** — one step below Champions. Moving even a fraction of them up the ladder compounds revenue.
- **At Risk players (28.45%) average only 4.47 sessions/week** — the natural target for re-engagement campaigns before they slide into Lost.
- **Lost Players' purchase rate (19.55%) is *higher* than At Risk (17.39%)** — these are players who paid but stopped playing. A win-back campaign has real monetary upside here.
- **Geography does not predict player value** — segment shares vary by less than 1.5 p.p. across Asia, Europe, USA, and Other. Echoes Case 02: demographics don't drive churn either.
- **Genre mix is nearly identical across segments** — value is driven by behavioral frequency and engagement, not game preference or location.

---

## 📈 Dashboard

**Live:** [iGaming RFM Player Segmentation — 40K Players (Tableau Public)](https://public.tableau.com/views/iGamingRFMPlayerSegmentation40KPlayers/Dashboard1)

![RFM Player Segmentation Dashboard](dashboards/rfm-player-segmentation.png?raw=true)

| # | Chart | Type | What it shows |
|---|---|---|---|
| 1 | Player Distribution by Segment & Session Frequency | Stacked Bar | How session activity splits across segments — Lost/At Risk dominate 0–3 sessions, Champions take over from 10+ |
| 2 | Segment Profile — Sessions & Purchase Rate | Bar (+ Tooltip) | Avg sessions per segment, purchase rate on hover |
| 3 | Segment Distribution by Location | 100% Stacked Bar | Segment shares are flat across all regions |
| 4 | Segment Distribution by Game Genre | Treemap | Genre preferences are proportional in every segment |

---

## 🗂️ SQL Files

| File | Purpose |
|---|---|
| `01_rfm_scores.sql` | Calculates R, F, M scores per player |
| `02_rfm_segments.sql` | Assigns players to 4 segments by total RFM score |
| `03_segment_profile.sql` | Aggregates segment-level metrics (sessions, purchase rate, age, level) |
| `04_segment_by_genre.sql` | Cross-tabulates segments by game genre |

---

## 🛠️ Tools

- **SQLite** (DB Browser) — RFM scoring & segmentation
- **Tableau Public** — dashboard
- **GitHub** — portfolio hosting
