-- Aliases for redability 
-- t ===> Track            
-- g ===> Genre 
-- a ===> Artists
-- ta ==> Tracks_to_artists
-- aq ==> Artists_to_Genre

-- AVG popularity by genre 
USE  spotify;
WITH GenrePopularity AS (
     SELECT
		  g.Genre_name AS Genre,
          AVG(t.Popularity) AS AVG_Popularity
	 FROM Track t
     INNER JOIN Genre g ON t.Genre_ID = g.Genre_ID
     GROUP BY g.Genre_name
						)
	SELECT * FROM GenrePopularity
    ORDER BY Avg_Popularity DESC;

-- Most energetic by genre
WITH MaxEnergy AS (
	 SELECT
		g.Genre_name AS Genre,
        t.Track_name AS Track,
        MAX(t.Energy) AS Max_Energy
        FROM Track t
        INNER JOIN Genre g ON t.Genre_ID = g.Genre_ID
        GROUP BY g.Genre_name, t.Track_name
					)
SELECT * FROM MaxEnergy
ORDER BY Max_Energy DESC;

-- Most Energetic Track per Genre including Artist
USE Spotify;
WITH GenreEnergy AS (
	SELECT
		g.Genre_name AS Genre,
        t.Track_name AS Track,
        a.Artist_name AS Artist,
        t.Energy
	FROM Track t
    JOIN Genre g ON t.Genre_ID = g.Genre_ID
    JOIN Tracks_to_artist ta ON t.Track_ID = ta.Track_ID
    JOIN Artists a ON ta.Artist_ID = a.Artist_ID
    )
    SELECT
    Genre, Track, Artist, Energy
    FROM GenreEnergy
    WHERE (Genre, Energy) IN (
    SELECT
		Genre,
        MAX(Energy)
        From GenreEnergy
        GROUP BY Genre
        )
ORDER BY Energy DESC;



