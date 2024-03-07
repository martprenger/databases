-- 1. Hoeveel minuten (totaal) is een lied gespeeld op Spotify de afgelopen maand
select sum(speel_lengte) as totaal_minuten
from speel_geschiedenis
where speel_datum >= date_sub(current_date, interval 1 month);

-- 2. Geef een top 10 van meest gespeelde albums
select a.naam as album_naam, count(s.track_ID) as speel_count
from album a
         join album_track at on a.album_ID = at.album_ID
    join speel_geschiedenis s on at.track_ID = s.track_ID
group by a.album_ID
order by speel_count desc
    limit 10;

-- 3. Geef een top 10 van meest gespeelde tracks
select t.naam as track_naam, count(s.track_ID) as speel_count
from track t
         join speel_geschiedenis s on t.track_ID = s.track_ID
group by t.track_ID
order by speel_count desc
    limit 10;