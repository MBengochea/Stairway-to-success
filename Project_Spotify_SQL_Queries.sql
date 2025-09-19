-- Aliases for redability 
-- t ===> Track            
-- g ===> Genre 
-- a ===> Artists
-- ta ==> Tracks_to_artists
-- aq ==> Artists_to_Genre

USE spotify;

-- 1. Average popularity by genre
WITH GenrePopularity AS (
    SELECT 
        g.Genre_name AS Genre,
        AVG(t.Popularity) AS Avg_Popularity
    FROM Track t
    JOIN Genre g ON t.Genre_ID = g.Genre_ID
    GROUP BY g.Genre_name
)
SELECT * FROM GenrePopularity
ORDER BY Avg_Popularity DESC;

-- 2. Most energetic track per genre (with artist)
WITH GenreEnergy AS (
    SELECT 
        g.Genre_name AS Genre,
        t.Track_name AS Track,
        t.Energy,
        ROW_NUMBER() OVER (PARTITION BY g.Genre_name ORDER BY t.Energy DESC) AS EnergyRank
    FROM Track t
    JOIN Genre g ON t.Genre_ID = g.Genre_ID
)
SELECT 
    Genre,
    Track,
    Energy
FROM GenreEnergy
WHERE EnergyRank = 1
ORDER BY Energy DESC;


-- 3. Track length classification using CASE
SELECT 
    Track_name,
    Length,
    CASE 
        WHEN Length < 180 THEN 'Short'
        WHEN Length BETWEEN 180 AND 300 THEN 'Medium'
        ELSE 'Long'
    END AS Length_Category
FROM Track
ORDER BY Length DESC;

-- 4.1 # Calculate mean track length
SELECT 
    ROUND(AVG(Length), 2) AS Mean_Length_Seconds
FROM Track;


-- 5. Top 10 popularity songs by artist and genre
SELECT 
    t.Track_name AS Track,
    a.Artist_name AS Artist,
    g.Genre_name AS Genre,
    t.Popularity,
    t.Energy,
    t.Length
FROM Track t
JOIN Tracks_to_artists ta ON t.Track_ID = ta.Track_ID
JOIN Artists a ON ta.Artist_ID = a.Artist_ID
JOIN Genre g ON t.Genre_ID = g.Genre_ID
ORDER BY t.Popularity DESC
LIMIT 10;

-- 6. Artist with most tracks
WITH ArtistTrackCount AS (
    SELECT 
        a.Artist_name AS Artist,
        COUNT(ta.Track_ID) AS Track_Count
    FROM Artists a
    JOIN Tracks_to_artists ta ON a.Artist_ID = ta.Artist_ID
    GROUP BY a.Artist_name
)
SELECT * FROM ArtistTrackCount
ORDER BY Track_Count DESC
LIMIT 1;

#7
SELECT 
    genre,
    artist_name,
    ROUND(AVG(popularity),1) AS avg_popularity,
    COUNT(track_name) AS total_tracks
FROM top_hits_clean
GROUP BY genre, artist_name
HAVING COUNT(track_name) > 1
ORDER BY avg_popularity DESC, total_tracks DESC
LIMIT 5;
#8
SELECT 
    CASE 
        WHEN Length < 180 THEN 'Short'
        WHEN Length BETWEEN 180 AND 300 THEN 'Medium'
        ELSE 'Long'
    END AS Length_Category,
    ROUND(AVG(Popularity), 2) AS Avg_Popularity,
    COUNT(*) AS Track_Count
FROM Track
GROUP BY Length_Category
ORDER BY Avg_Popularity DESC;

# canadian pop analysis
SELECT 
    CASE 
        WHEN t.Popularity > 75 THEN 'More Popular'
        ELSE 'Less Popular'
    END AS Popularity_Group,
    ROUND(AVG(t.Energy), 2) AS Avg_Energy,
    ROUND(AVG(t.Length), 2) AS Avg_Length,
    COUNT(*) AS Track_Count
FROM Track t
JOIN Genre g ON t.Genre_ID = g.Genre_ID
WHERE g.Genre_name = 'canadian pop'
GROUP BY Popularity_Group
ORDER BY Avg_Energy DESC;

-- #2nd part
SELECT 
    t.Track_name,
    t.Energy,
    t.Length
FROM Track t
JOIN Genre g ON t.Genre_ID = g.Genre_ID
WHERE g.Genre_name = 'canadian pop';

SELECT 
    t.Track_name,
    t.Popularity
FROM Track t
JOIN Genre g ON t.Genre_ID = g.Genre_ID
WHERE g.Genre_name = 'canadian pop'
  AND t.Track_name IN ('Señorita', 'If I Can\'t Have You');
