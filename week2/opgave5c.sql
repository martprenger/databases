
drop schema if exists HBO_instelling;
create schema HBO_instelling;

create table HBO_instelling.student
(
    student_ID int primary key,
    student_nummer int,
    voornaam varchar(255),
    achternaam varchar(255),
    geboortedatum date,
    start_jaar date
);

create table HBO_instelling.thema
(
    thema_ID int primary key,
    naam varchar(255),
    credits int,
    jaar date,
    periode date
);

create table HBO_instelling.module
(
    module_ID int primary key,
    naam varchar(255),
    credits int,
    jaar date,
    periode date
);

create table HBO_instelling.toets
(
    toets_ID int primary key,
    credits int
);

create table HBO_instelling.thema_module
(
    thema_ID int primary key,
    module_ID int,
    foreign key (thema_ID) references HBO_instelling.thema(thema_ID),
    foreign key (module_ID) references HBO_instelling.module(module_ID)
);

create table HBO_instelling.inschrijving
(
    inschrijving_ID int primary key,
    student_ID int,
    thema_ID int,
    jaar date,
    periode date,
    foreign key (student_ID) references HBO_instelling.student(student_ID),
    foreign key (thema_ID) references HBO_instelling.thema(thema_ID)
);

create table HBO_instelling.module_toets
(
    module_ID int primary key,
    toets_ID int,
    foreign key (module_ID) references HBO_instelling.module(module_ID),
    foreign key (toets_ID) references HBO_instelling.toets(toets_ID)
);

create table HBO_instelling.resultaat
(
    resultaat_ID int primary key,
    toets_ID int,
    student_ID int,
    cijfer int,
    foreign key (toets_ID) references HBO_instelling.toets(toets_ID),
    foreign key (student_ID) references HBO_instelling.student(student_ID)
);