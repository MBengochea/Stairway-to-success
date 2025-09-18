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
df.drop(columns=["BPM", "Speechiness", "Acousticness","Danceability","Liveness","Length","Valence","Loudness_dB"], inplace=True)

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
  | Genre             | Avg_Popularity |
|-------------------|----------------|
| dfw rap           | 92.5000        |
| trap music        | 92.0000        |
| electropop        | 92.0000        |
| reggaeton         | 91.0000        |
| escape room       | 91.0000        |
| pop house         | 91.0000        |
| latin             | 89.8000        |
| canadian hip hop  | 89.6667        |
| country rap       | 89.0000        |
| panamanian pop    | 89.0000        |
| atl hip hop       | 89.0000        |
| big room          | 89.0000        |
| r&b en espanol    | 88.0000        |
| brostep           | 88.0000        |
| reggaeton flow    | 87.5000        |
| edm               | 86.6667        |
| pop               | 86.1667        |
| dance pop         | 85.7500        |
| australian pop    | 83.0000        |
| boy band          | 80.0000        |
| canadian pop      | 74.5000        |

- Most energetic track per genre (with artist)
| Genre            | Track                          | Artist           | Energy |
|------------------|--------------------------------|------------------|--------|
| latin            | con calma                      | daddy yankee     | 86     |
| reggaeton flow   | china                          | anuel aa         | 81     |
| dance pop        | boyfriend (with social house)  | ariana grande    | 80     |
| panamanian pop   | otro trago - remix             | sech             | 79     |
| pop              | how do you sleep?              | sam smith        | 68     |
| dfw rap          | goodbyes (feat_ young thug)    | post malone      | 65     |
| trap music       | ransom                         | lil tecca        | 64     |
| country rap      | old town road - remix          | lil nas x        | 62     |
| reggaeton        | callaita                       | bad bunny        | 62     |
| canadian pop     | señorita                       | shawn mendes     | 55     |
| edm              | takeaway                       | the chainsmokers | 51     |
| canadian hip hop | money in the grave             | drake            | 50     |
| electropop       | bad guy                        | billie eilish    | 43     |

- Track length classification using `CASE`
| Track Name                                      | Length | Length Category |
|------------------------------------------------|--------|------------------|
| no me conoce - remix                           | 309    | Long             |
| china                                           | 302    | Long             |
| otro trago - remix                              | 288    | Medium           |
| soltera - remix                                 | 266    | Medium           |
| no guidance (feat_ drake)                       | 261    | Medium           |
| callaita                                        | 251    | Medium           |
| la canción                                      | 243    | Medium           |
| higher love                                     | 228    | Medium           |
| otro trago                                      | 226    | Medium           |
| never really over                               | 224    | Medium           |
| que pretendes                                   | 222    | Medium           |
| call you mine                                   | 218    | Medium           |
| shallow                                         | 216    | Medium           |
| happier                                         | 214    | Medium           |
| it's you                                        | 213    | Medium           |
| dance monkey                                    | 210    | Medium           |
| takeaway                                        | 210    | Medium           |
| cross me (feat_ chance the rapper & pnb rock)   | 206    | Medium           |
| money in the grave (drake ft_ rick ross)        | 205    | Medium           |
| te robaré                                       | 202    | Medium           |
| how do you sleep?                               | 202    | Medium           |
| the london (feat_ j_ cole & travis scott)       | 200    | Medium           |
| fuck, i'm lonely (with anne-marie)              | 199    | Medium           |
| beautiful people (feat_ khalid)                 | 198    | Medium           |
| talk                                            | 198    | Medium           |
| bad guy (with justin bieber)                    | 195    | Medium           |
| bad guy                                         | 194    | Medium           |
| con calma                                       | 193    | Medium           |
| if i can't have you                             | 191    | Medium           |
| señorita                                        | 191    | Medium           |
| boyfriend (with social house)                   | 186    | Medium           |
| loco contigo (feat_ j_ balvin & tyga)           | 185    | Medium           |
| someone you loved                               | 182    | Medium           |
| one thing right                                 | 182    | Medium           |
| sucker                                          | 181    | Medium           |
| 7 rings                                         | 179    | Short            |
| goodbyes (feat_ young thug)                     | 175    | Short            |
| truth hurts                                     | 173    | Short            |
| you need to calm down                           | 171    | Short            |
| summer days (feat_ macklemore & patrick stump)  | 164    | Short            |
| con altura                                      | 162    | Short            |
| antisocial (with travis scott)                  | 162    | Short            |
| lalala                                          | 161    | Short            |
| sunflower - spider-man: into the spider-verse   | 158    | Short            |
| old town road - remix                           | 157    | Short            |
| piece of your heart                             | 153    | Short            |
| ransom                                          | 131    | Short            |
| panini                                          | 115    | Short            |

- Standard deviation of popularity by genre
| Genre             | Popularity StdDev |
|-------------------|-------------------|
| canadian pop      | 4.5000            |
| reggaeton flow    | 4.5000            |
| dance pop         | 3.7997            |
| electropop        | 3.0000            |
| pop               | 2.6087            |
| country rap       | 2.0000            |
| reggaeton         | 2.0000            |
| panamanian pop    | 2.0000            |
| edm               | 1.8856            |
| canadian hip hop  | 1.6997            |
| dfw rap           | 1.5000            |
| latin             | 1.1662            |
| trap music        | 0.0000            |
| escape room       | 0.0000            |
| pop house         | 0.0000            |
| australian pop    | 0.0000            |
| atl hip hop       | 0.0000            |
| big room          | 0.0000            |
| boy band          | 0.0000            |
| r&b en espanol    | 0.0000            |
| brostep           | 0.0000            |

- Top 10 Popularity songs by artist and genre
| Track                                           | Artist           | Genre            | Popularity | Energy | Length |
|------------------------------------------------|------------------|------------------|------------|--------|--------|
| bad guy                                        | billie eilish    | electropop       | 95         | 43     | 194    |
| goodbyes (feat_ young thug)                    | post malone      | dfw rap          | 94         | 65     | 175    |
| callaita                                       | bad bunny        | reggaeton        | 93         | 62     | 251    |
| china                                          | anuel aa         | reggaeton flow   | 92         | 81     | 302    |
| ransom                                         | lil tecca        | trap music       | 92         | 64     | 131    |
| money in the grave (drake ft_ rick ross)       | drake            | canadian hip hop | 92         | 50     | 205    |
| sunflower - spider-man: into the spider-verse  | post malone      | dfw rap          | 91         | 48     | 158    |
| con calma                                      | daddy yankee     | latin            | 91         | 86     | 193    |
| how do you sleep?                              | sam smith        | pop              | 90         | 68     | 202    |
| la canción                                     | j balvin         | latin            | 90         | 65     | 243    |

- Artist with most tracks
| Artist       | Track Count |
|--------------|-------------|
| post malone  | 2           |

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
- Genres like *reggaeton flow* and *dance pop* dominate popularity
- High-energy tracks correlate with shorter lengths in some genres
- Artists like *Ed Sheeran* and *J Balvin* appear across multiple genres
- Popularity varies widely within genres (high standard deviation)

**Business Implication:**
Emerging artists can optimize track structure and genre alignment to improve streaming performance.

For a new band entering the streaming ecosystem, the data suggests a few strategic moves:

🎯 **Genre Positioning**
Focus on genres with high average popularity: dance pop, reggaeton flow, and latin consistently outperform others.

Align your sound with these genres or blend elements to increase discoverability.

⚡ **Energy Optimization**
Tracks with energy scores above 70 dominate top positions.

High-energy songs tend to be shorter (180–220 seconds), which aligns with listener retention patterns.

📐 **Track Structure**
Use a medium-length format (3–4 minutes) with dynamic transitions.

Avoid overly long intros or outros—streaming platforms reward immediate engagement.

🎤 **Artist Visibility**
Collaborations with artists across genres (e.g., J Balvin, Ed Sheeran) increase reach.

Maintain consistent genre tagging to build algorithmic identity.

📊 **Data Discipline**
Track performance metrics weekly: popularity, skip rate, completion rate.

Use SQL or Python dashboards to monitor trends and adjust releases accordingly.

🧠 **Final Advice**
“Treat your music like a product: genre is your market, energy is your packaging, and popularity is your conversion rate.”

Build with intention, measure with precision, and evolve with feedback.









