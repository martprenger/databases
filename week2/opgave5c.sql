drop schema if exists HBO_instelling;
create schema HBO_instelling;

use HBO_instelling;

create table student
(
    student_ID     int not null auto_increment,
    student_nummer int,
    voornaam       varchar(255),
    achternaam     varchar(255),
    geboortedatum  date,
    start_jaar     date,
    primary key (student_ID)
);

create table thema
(
    thema_ID int not null auto_increment,
    naam     varchar(255),
    credits  int,
    jaar     date,
    periode  date,
    primary key (thema_ID)
);

create table module
(
    module_ID int not null auto_increment,
    naam      varchar(255),
    credits   int,
    jaar      date,
    periode   date,
    primary key (module_ID)
);

create table toets
(
    toets_ID int not null auto_increment,
    credits  int,
    primary key (toets_ID)
);

create table thema_module
(
    thema_ID  int not null,
    module_ID int not null,
    primary key (thema_ID, module_ID),
    foreign key (thema_ID) references HBO_instelling.thema (thema_ID),
    foreign key (module_ID) references HBO_instelling.module (module_ID)
);

create table inschrijving
(
    inschrijving_ID int not null auto_increment,
    student_ID      int,
    thema_ID        int,
    jaar            date,
    periode         date,
    primary key (inschrijving_ID),
    foreign key (student_ID) references HBO_instelling.student (student_ID),
    foreign key (thema_ID) references HBO_instelling.thema (thema_ID)
);

create table module_toets
(
    module_ID int not null,
    toets_ID  int not null,
    primary key (module_ID, toets_ID),
    foreign key (module_ID) references HBO_instelling.module (module_ID),
    foreign key (toets_ID) references HBO_instelling.toets (toets_ID)
);

create table resultaat
(
    resultaat_ID int not null auto_increment,
    toets_ID     int,
    student_ID   int,
    cijfer       int,
    primary key (resultaat_ID),
    foreign key (toets_ID) references HBO_instelling.toets (toets_ID),
    foreign key (student_ID) references HBO_instelling.student (student_ID)
);