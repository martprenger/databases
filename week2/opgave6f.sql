-- 1. Hoeveel minuten (totaal) is een lied gespeeld op Spotify de afgelopen maand
SELECT SUM(speel_lengte) as totaal_minuten
FROM speel_geschiedenis
WHERE speel_datum >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH);

-- 2. Geef een top 10 van meest gespeelde albums
SELECT a.naam as album_naam, COUNT(s.track_ID) as speel_count
FROM album a
         JOIN album_track at ON a.album_ID = at.album_ID
    JOIN speel_geschiedenis s ON at.track_ID = s.track_ID
GROUP BY a.album_ID
ORDER BY speel_count DESC
    LIMIT 10;

-- 3. Geef een top 10 van meest gespeelde tracks
SELECT t.naam as track_naam, COUNT(s.track_ID) as speel_count
FROM track t
         JOIN speel_geschiedenis s ON t.track_ID = s.track_ID
GROUP BY t.track_ID
ORDER BY speel_count DESC
    LIMIT 10;