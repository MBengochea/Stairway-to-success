SELECT AVG(Energy) AS avg_energy, AVG(Popularity) AS avg_popularity FROM top50;

SELECT Genre, AVG(Popularity) AS avg_popularity
FROM top50
GROUP BY Genre
ORDER BY avg_popularity DESC;

SELECT "Track.Name", Artist.Name, Popularity
FROM top50
ORDER BY Popularity DESC
LIMIT 5;

