# 🎵 Stairway to Success — Spotify Data Analysis

## 📊 Project Overview
A data-driven exploration of the top 50 global music tracks using SQL and Python. This project uncovers genre trends, energy levels, and popularity metrics to support emerging artists with actionable insights.

---

## 🧠 Objectives
- Execute SQL queries for insights using `JOIN`, `GROUP BY`, `ORDER BY`, `CASE`
- Utilize SQL functions for summarization: `AVG`, `MAX`, `MIN`, `STDDEV`
- Develop visualizations using Python libraries
- Compile a comprehensive report of analysis and insights
- Design and prepare a presentation summarizing the project, challenges, insights, and outcomes

---

## 🗃️ Database Schema

**Tables:**
- `Track`: song metadata
- `Artists`: performer names
- `Genre`: genre definitions
- `Tracks_to_artists`: many-to-many relationship
- `Artists_to_Genre`: artist classification

**Entity Relationship Diagram:**
[Artists] → [Tracks_to_artists] ← [Track] → [Genre] ↓ ↑ ↑ ↑ [Artists_to_Genre] ────────────────→───────────┘


---

## 🧮 SQL Insights

**Queries Executed:**
- Average popularity by genre
- Most energetic track per genre (with artist)
- Track length classification using `CASE`
- Standard deviation of popularity by genre
- Artist with most tracks

**Techniques Used:**
- Common Table Expressions (CTEs)
- Window functions (`RANK()`)
- Clean joins and readable aliases
- 
## 🧩 Challenges Faced
- Normalizing artist-genre relationships
- Resolving multi-artist tracks
- Ensuring reproducibility across SQL and Python environments
---

## 📈 Python Visualizations

**Libraries:**
- `pandas`
- `matplotlib`
- `seaborn`

**Visuals Created:**
- Bar chart: Average popularity by genre
- Scatter plot: Energy vs. Popularity
- Box plot: Popularity distribution by genre
- Histogram: Track length categories

---

## 📋 Report Summary

**Key Findings:**
- Genres like *reggaeton flow* and *dance pop* dominate popularity
- High-energy tracks correlate with shorter lengths in some genres
- Artists like *Ed Sheeran* and *J Balvin* appear across multiple genres
- Popularity varies widely within genres (high standard deviation)

**Business Implication:**
Emerging artists can optimize track structure and genre alignment to improve streaming performance.

For a new band entering the streaming ecosystem, the data suggests a few strategic moves:

🎯 Genre Positioning
Focus on genres with high average popularity: dance pop, reggaeton flow, and latin consistently outperform others.

Align your sound with these genres or blend elements to increase discoverability.

⚡ Energy Optimization
Tracks with energy scores above 70 dominate top positions.

High-energy songs tend to be shorter (180–220 seconds), which aligns with listener retention patterns.

📐 Track Structure
Use a medium-length format (3–4 minutes) with dynamic transitions.

Avoid overly long intros or outros—streaming platforms reward immediate engagement.

🎤 Artist Visibility
Collaborations with artists across genres (e.g., J Balvin, Ed Sheeran) increase reach.

Maintain consistent genre tagging to build algorithmic identity.

📊 Data Discipline
Track performance metrics weekly: popularity, skip rate, completion rate.

Use SQL or Python dashboards to monitor trends and adjust releases accordingly.

🧠 Final Advice
“Treat your music like a product: genre is your market, energy is your packaging, and popularity is your conversion rate.”

Build with intention, measure with precision, and evolve with feedback.









