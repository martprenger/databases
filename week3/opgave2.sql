drop table if exists audit_film_updates;

create table audit_film_updates
(
    id         smallint unsigned not null auto_increment,
    film_id    smallint unsigned not null,
    film_title VARCHAR(255),
    user_name  VARCHAR(30)       not null,
    date       DATETIME          not null,
    action     enum ('INS','UPD','DEL'),
    primary key (id)
);

drop trigger if exists film_insert_trigger;
drop trigger if exists film_update_trigger;
drop trigger if exists film_delete_trigger;

-- trigger voor het toevoegen van een film
delimiter //
create trigger film_insert_trigger
    after insert on film
    for each row
begin
    insert into audit_film_updates (film_id, film_title, user_name, date, action)
    values (new.film_id, new.title, user(), now(), 'INS');
end;
//

-- trigger voor het bijwerken van een film
create trigger film_update_trigger
    after UPDATE on film
    for each row
begin
    insert into audit_film_updates (film_id, film_title, user_name, date, action)
    values (new.film_id, new.title, user(), now(), 'UPD');
end;
//

-- trigger voor het verwijderen van een film
create trigger film_delete_trigger
    after DELETE on film
    for each row
begin
    insert into audit_film_updates (film_id, film_title, user_name, date, action)
    values (OLD.film_id, OLD.title, user(), now(), 'DEL');
end;
//
delimiter ;

insert into film (film_id, title, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)
values (5000, 'ACADEMY DINOSAUR', 2006, 1, 6, 0.99, 86, 20.99, 'PG', 'Deleted Scenes,Behind the Scenes');

update film set title = 'ACADEMY DINOSAUR 2' where film_id = 1;

delete from film where film_id = 5000;

SELECT * FROM audit_film_updates;

