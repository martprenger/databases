create view view_total_sales as
select s.store_id,
       c.city,
       co.country,
       round(sum(p.amount)) as total_sales
from payment p
         join rental r on p.rental_id = r.rental_id
         join inventory i on r.inventory_id = i.inventory_id
         join store s on i.store_id = s.store_id
         join address a on s.address_id = a.address_id
         join city c on a.city_id = c.city_id
         join country co on c.country_id = co.country_id
group by s.store_id, c.city, co.country;

select *
from view_total_sales;