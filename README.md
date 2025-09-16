Stairway to Success

A data-driven exploration of the top 50 global music tracks, analyzing genre trends, energy levels, and popularity metrics using SQL and Python.

##  Project Overview

This project uses a dataset of the top 50 tracks from Spotify to uncover patterns in musical taste and genre performance. It includes:
- SQL queries for data insights
- Python visualizations with pandas, seaborn, and matplotlib
- An Entity Relationship Diagram (ERD) using Graphviz

1. Business Challenge
Emerging artists and bands struggle to break through because:
They lack data-driven insights about what makes a song competitive.
They often rely only on intuition, personal taste, or costly industry gatekeepers.
Platforms like Spotify reward certain patterns (genre, length, release strategy, playlisting) that most newcomers don’t fully understand.
Our company aims to solve this by analyzing trends in top Spotify songs and translating them into actionable recommendations for newcomers.

2. Target Customers
Independent musicians and bands
Small labels & artist managers
Music schools and academies supporting new talent
16:38
3. Value Proposition
Data-driven insights on song structure, style, and length, and formatting strategy
Predictions on which characteristics increase streaming success
Strategic guidance on branding and audience-building

Columns included:
Track.Name
Artist.Name
Genre
Energy
Length (seconds)
Popularity

##  Folder Structure


Energy
Length (seconds)
Popularity


##  How to Run

1. Clone the repo  
   `git clone https://github.com/MBengochea/Stairway-to-success.git`

2. Install dependencies  
   `pip install -r requirements.txt`

3. Open the notebook  
   `jupyter notebook notebooks/02_figures.ipynb`

4. Run SQL queries using your preferred SQL engine

##  Dataset

Source: `top50.csv` from Spotify top tracks  
Fields include: `Track.Name`, `Genre`, `Popularity`, `Energy`, `Danceability`, etc.
