drop schema if exists plane_seat;
create schema plane_seat;
use plane_seat;

create table seat
(
    seat_id int not null auto_increment,
    taken   boolean,
    primary key (seat_id)
);

create table user
(
    user_id int not null auto_increment,
    seat_id int,
    primary key (user_id),
    foreign key (seat_id) references seat (seat_id)
);

insert into seat (taken)
values (false),
       (false),
       (false),
       (false),
       (false),
       (false),
       (false),
       (false),
       (false),
       (false);

insert into user (user_id)
values (1),
       (2),
       (3),
       (4),
       (5),
       (6),
       (7),
       (8),
       (9),
       (10),
       (11),
       (12),
       (13),
       (14),
       (15),
       (16),
       (17),
       (18),
       (19),
       (20);

start transaction;

set @seat := (select seat_id
              from seat
              where taken = false
              order by rand()
              limit 1);

update seat
set taken = true
where seat_id = @seat;

update user
set seat_id = @seat
where user_id = 11;

commit;

select * from seat;
select * from user;
