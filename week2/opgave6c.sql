drop schema if exists spotify;
create schema spotify;

use spotify;

create table gebruiker (
    gebruiker_ID int auto_increment,
    naam varchar(255) not null,
    email varchar(255) not null,
    bankrekening varchar(255),
    primary key (gebruiker_ID)
);

create table abonoment (
    abonoment_ID int auto_increment not null,
    type varchar(255) not null,
    betalende_gebruiker_ID int not null,
    aantal_gebruikers int not null,
    primary key (abonoment_ID),
    foreign key (betalende_gebruiker_ID) references gebruiker(gebruiker_ID)
);

create table abonoment_gebruiker (
    abonoment_ID int not null,
    gebruiker_ID int not null,
    primary key (abonoment_ID, gebruiker_ID),
    foreign key (abonoment_ID) references abonoment(abonoment_ID),
    foreign key (gebruiker_ID) references gebruiker(gebruiker_ID)
);

create table genre (
    genre_ID int auto_increment not null,
    naam varchar(255) not null,
    description text,
    primary key (genre_ID)
);

create table artiest (
    artiest_ID int auto_increment not null,
    naam varchar(255) not null,
    primary key (artiest_ID)
);

create table album (
    album_ID int auto_increment not null,
    naam varchar(255) not null,
    type text,
    release_date date,
    genre_ID int,
    primary key (album_ID),
    foreign key (genre_ID) references genre(genre_ID)
);

create table track (
    track_ID int auto_increment not null,
    naam varchar(255) not null,
    track_nummer int not null,
    duur int,
    is_playable boolean,
    primary key (track_ID)
);

create table album_track (
    album_ID int not null,
    track_ID int not null,
    primary key (album_ID, track_ID),
    foreign key (album_ID) references album(album_ID),
    foreign key (track_ID) references track(track_ID)
);

create table album_artiest (
    album_ID int not null,
    artiest_ID int not null,
    primary key (album_ID, artiest_ID),
    foreign key (album_ID) references album(album_ID),
    foreign key (artiest_ID) references artiest(artiest_ID)
);

create table track_artiest (
    track_ID int not null,
    artiest_ID int not null,
    primary key (track_ID, artiest_ID),
    foreign key (track_ID) references track(track_ID),
    foreign key (artiest_ID) references artiest(artiest_ID)
);

create table playlist (
    playlist_ID int auto_increment not null,
    naam varchar(255) not null,
    omschrijving text,
    eigenaar_ID int not null,
    genre_ID int,
    is_public boolean,
    primary key (playlist_ID),
    foreign key (eigenaar_ID) references gebruiker(gebruiker_ID),
    foreign key (genre_ID) references genre(genre_ID)
);

create table playlist_track (
    playlist_ID int not null,
    track_ID int not null,
    primary key (playlist_ID, track_ID),
    foreign key (playlist_ID) references playlist(playlist_ID),
    foreign key (track_ID) references track(track_ID)
);

create table speel_geschiedenis (
    speel_geschiedenis_ID int auto_increment not null,
    gebruiker_ID int not null,
    track_ID int not null,
    speel_lengte int not null,
    speel_datum date not null,
    primary key (speel_geschiedenis_ID),
    foreign key (gebruiker_ID) references gebruiker(gebruiker_ID),
    foreign key (track_ID) references track(track_ID)
);

create table library (
    gebruiker_ID int not null,
    link_ID int not null,
    type varchar(255) not null,
    primary key (gebruiker_ID, link_ID),
    foreign key (gebruiker_ID) references gebruiker(gebruiker_ID),
    foreign key (link_ID) references album(album_ID),
    foreign key (link_ID) references track(track_ID),
    foreign key (link_ID) references playlist(playlist_ID)
);


