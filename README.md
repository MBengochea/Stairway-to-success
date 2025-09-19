# 🎵 Stairway to Success — Spotify Data Analysis

Business Idea
Emerging artists and bands find it hard to make a breakthrough because:
They lack data-driven insights into what makes a competitive song.
They often rely solely on intuition or personal taste, or seek the advice of costly industry gatekeepers.
Platforms like Spotify reward certain patterns (genre, length, release strategy and playlisting) that most newcomers do not fully understand.
Our company aims to solve this problem by analysing trends in popular Spotify songs and translating them into actionable recommendations for newcomers.

Target customers
Independent musicians and bands
Small labels and artist managers
Music schools and academies that support new talent

## 📊 Project Overview
A data-driven exploration of the top 50 global music tracks using SQL and Python. This project uncovers genre trends, energy levels, and popularity metrics to support emerging artists with actionable insights.

---

## 🧠 Objectives
- Execute SQL queries for insights using `JOIN`, `GROUP BY`, `ORDER BY`, `CASE`
- Utilize SQL functions for summarization: `AVG`, `MAX`, `MIN`, 'DEVSTD'
- Develop visualizations using Python libraries
- Compile a comprehensive report of analysis and insights
- Design and prepare a presentation summarizing the project, challenges, insights, and outcomes

---
🧼 Python Data Cleaning Summary
import pandas as pd

# Load raw CSV
df_raw = pd.read_csv("spotify_raw.csv")

# Rename columns for consistency
df = df_raw.rename(columns={
    "Track.Name": "Track_name",
    "Artist.Name": "Artist_name",
    "Genre": "Genre",
    "Beats.Per.Minute": "BPM",
    "Energy": "Energy",
    "Danceability": "Danceability",
    "Loudness..dB..": "Loudness_dB",
    "Liveness": "Liveness",
    "Valence.": "Valence",
    "Length.": "Length",
    "Acousticness..": "Acousticness",
    "Speechiness.": "Speechiness",
    "Popularity": "Popularity"
})

# Strip whitespace and unify text casing
df["Track_name"] = df["Track_name"].str.strip()
df["Artist_name"] = df["Artist_name"].str.strip().str.lower()
df["Genre"] = df["Genre"].str.strip().str.lower()

# Remove duplicates
df = df.drop_duplicates()

# Convert Length from seconds to integer
df["Length"] = df["Length"].astype(int)

# Validate numeric columns
numeric_cols = ["BPM", "Energy", "Danceability", "Loudness_dB", "Liveness",
                "Valence", "Length", "Acousticness", "Speechiness", "Popularity"]
df[numeric_cols] = df[numeric_cols].apply(pd.to_numeric, errors="coerce")

# Drop columns with no importance for our analysis
df.drop(columns=["BPM", "Speechiness", "Acousticness","Danceability","Liveness","Valence","Loudness_dB"], inplace=True)

# Drop rows with missing critical values
df = df.dropna(subset=["Track_name", "Artist_name", "Genre", "Energy", "Popularity"])

# Final structure preview
df_cleaned = df[["Track_name", "Artist_name", "Genre", "Energy", "Length", "Popularity"]]

## 🗃️ Database Schema

**Tables:**
- `Track`: song metadata
- `Artists`: performer names
- `Genre`: genre definitions
- `Tracks_to_artists`: many-to-many relationship
- `Artists_to_Genre`: artist classification

✅ Clean Code Practices Applied
Small Functions: Modular steps for renaming, formatting, and validation

Descriptive Naming: Clear column labels and variable names

Reproducibility: Can be rerun on similar datasets

Scalability: Ready for integration with SQL or visualization pipelines

**Entity Relationship Diagram:**
[Artists] → [Tracks_to_artists] ← [Track] → [Genre] ↓ ↑ ↑ ↑ [Artists_to_Genre] ────────────────→───────────┘


## 🧮 SQL Insights

**Queries Executed:**
- Average popularity by genre
- Most energetic track per genre (with artist)
- Track length classification using `CASE`
- Top 10 Popularity songs by artist and genre
- Std Deviation of popularity and isolation of genre for analysis

**Techniques Used:**
- Common Table Expressions (CTEs)
- Window functions (`RANK()`)
- Clean joins and readable aliases

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
- Summary Report

Key Findings:
.- Genres like rap, reggaeton flow and dance pop dominate popularity
.- High-energy tracks correlate with shorter lengths in some genres.
.- Artists like Ed Sheeran and J Balvin appear across multiple genres, that means an artist can be successful in different genres.
.- Business Implication: Emerging artists can optimize track structure and genre alignment to improve streaming performance.



**Business Implication:**
Strategies based on Analysis

.- Genre Positioning Focus on genres with high average popularity: dance pop, reggaeton flow, and latin consistently outperform others. 
.- Align your sound with these genres or blend elements to increase discoverability.
.- Energy Optimization Tracks with energy scores above 70 dominate top positions.
.- High-energy songs tend to be shorter (180–220 seconds), which aligns with listener retention patterns.
.- Track Structure Use a medium-length format (3–4 minutes) with dynamic transitions.
.- Avoid overly long intros or outros—streaming platforms reward immediate engagement.
.- Artist Visibility Collaborations with artists across genres (e.g., J Balvin, Ed Sheeran) increase reach.
.- Maintain consistent genre tagging to build algorithmic identity.
.- Data Discipline Track performance metrics weekly: popularity, skip rate, completion rate.
.- Use SQL or Python dashboards to monitor trends and adjust releases accordingly.
.- Final Advice “Treat your music like a product: genre is your market, energy is your packaging, and popularity is your conversion rate.”
.- Build with intention, measure with precision, and evolve with feedback.









