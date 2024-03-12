drop function if exists my_report;

delimiter //
create function my_report(
    month smallint unsigned,
    year smallint unsigned,
    min_amount smallint unsigned
)
    returns smallint unsigned
begin
    declare result smallint unsigned;
    select count(*)
    into result
    from (select customer_id
          from payment
          where month(payment_date) = month
            and year(payment_date) = year
          group by customer_id
          having sum(amount) > min_amount) as subquery;
    return result;
end;
delimiter //

select my_report(8, 2005, 40);