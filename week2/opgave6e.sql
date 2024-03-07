-- Sample data for 'gebruiker' table
INSERT INTO gebruiker (naam, email, bankrekening) VALUES
    ('John Doe', 'john.doe@email.com', '1234567890'),
    ('Jane Smith', 'jane.smith@email.com', '9876543210'),
    ('Bob Johnson', 'bob.johnson@email.com', '5555555555'),
    ('Alice Brown', 'alice.brown@email.com', '1111111111'),
    ('Charlie Green', 'charlie.green@email.com', '9999999999'),
    ('Eva White', 'eva.white@email.com', '8888888888'),
    ('Mike Black', 'mike.black@email.com', '7777777777'),
    ('Linda Gray', 'linda.gray@email.com', '6666666666'),
    ('Sam Taylor', 'sam.taylor@email.com', '4444444444'),
    ('Sophie Miller', 'sophie.miller@email.com', '3333333333');

-- Sample data for 'abonoment' table
INSERT INTO abonoment (type, betalende_gebruiker_ID, aantal_gebruikers) VALUES
    ('Premium', 1, 1),
    ('Family', 2, 4),
    ('Student', 3, 1),
    ('Premium', 4, 1),
    ('Family', 5, 3),
    ('Premium', 6, 1),
    ('Student', 7, 1),
    ('Premium', 8, 1),
    ('Family', 9, 2),
    ('Premium', 10, 1);

-- Continue adding sample data for other tables...

-- Sample data for 'genre' table
INSERT INTO genre (naam, description) VALUES
    ('Pop', 'Popular music with catchy tunes'),
    ('Rock', 'Music with a strong beat and guitar-based'),
    ('Hip-Hop', 'Urban music with a rhythmic and rhyming speech'),
    ('Jazz', 'Musical style that originated at the beginning of the 20th century'),
    ('Electronic', 'Music produced using electronic technology'),
    ('Country', 'Music characterized by its rural roots and simple melodies'),
    ('R&B', 'Rhythm and Blues'),
    ('Classical', 'Art music produced in, or rooted in the traditions of, Western liturgical and secular music'),
    ('Reggae', 'Music that originated in Jamaica in the late 1960s'),
    ('Indie', 'Independent music not produced by major record labels');

-- Sample data for 'artiest' table
INSERT INTO artiest (naam) VALUES
    ('Ed Sheeran'),
    ('Beyoncé'),
    ('Drake'),
    ('Miles Davis'),
    ('Daft Punk'),
    ('Johnny Cash'),
    ('Rihanna'),
    ('Beethoven'),
    ('Bob Marley'),
    ('Arctic Monkeys');

-- Sample data for 'album' table
INSERT INTO album (naam, type, release_date, genre_ID) VALUES
    ('÷ (Divide)', 'Studio Album', '2017-03-03', 1),
    ('Lemonade', 'Studio Album', '2016-04-23', 1),
    ('Scorpion', 'Studio Album', '2018-06-29', 3),
    ('Kind of Blue', 'Studio Album', '1959-08-17', 4),
    ('Random Access Memories', 'Studio Album', '2013-05-17', 5),
    ('Johnny Cash at Folsom Prison', 'Live Album', '1968-05-01', 6),
    ('Anti', 'Studio Album', '2016-01-28', 7),
    ('Symphony No. 9', 'Symphony', '1824-05-07', 8),
    ('Legend', 'Compilation Album', '1984-05-08', 9),
    ('AM', 'Studio Album', '2013-09-09', 10);

-- Continue adding sample data for other tables...

-- Sample data for 'track' table
INSERT INTO track (naam, track_nummer, duur, is_playable) VALUES
    ('Shape of You', 1, 235, true),
    ('Formation', 1, 255, true),
    ('Gods Plan', 1, 198, true),
    ('So What', 3, 398, true),
    ('Get Lucky', 1, 369, true),
    ('Folsom Prison Blues', 1, 170, true),
    ('Work', 1, 221, true),
    ('Ode to Joy', 4, 588, true),
    ('One Love', 1, 177, true),
    ('Do I Wanna Know?', 1, 272, true);

-- Sample data for 'album_track' table
INSERT INTO album_track (album_ID, track_ID) VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 3),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 4),
    (9, 1),
    (10, 1);

-- Sample data for 'album_artiest' table
INSERT INTO album_artiest (album_ID, artiest_ID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Sample data for 'track_artiest' table
INSERT INTO track_artiest (track_ID, artiest_ID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Sample data for 'playlist' table
INSERT INTO playlist (naam, omschrijving, eigenaar_ID, genre_ID, is_public) VALUES
    ('Top Hits', 'The best of the charts', 1, 1, true),
    ('Chill Vibes', 'Relaxing tunes for any mood', 2, 5, true),
    ('Workout Jams', 'Energizing tracks for your workout', 3, 3, true),
    ('Classical Gems', 'Timeless pieces for a refined taste', 4, 8, true),
    ('Reggae Rhythms', 'Feel the positive vibes', 5, 9, true),
    ('Indie Picks', 'Discover new independent artists', 6, 10, true),
    ('R&B Classics', 'Soulful sounds from the past', 7, 7, true),
    ('Rock Anthems', 'Powerful rock hits', 8, 2, true),
    ('Electronic Beats', 'Dance to the electronic rhythm', 9, 5, true),
    ('Country Roads', 'Journey through country music', 10, 6, true);

-- Sample data for 'playlist_track' table
INSERT INTO playlist_track (playlist_ID, track_ID) VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (2, 5),
    (2, 6),
    (3, 7),
    (3, 8),
    (3, 9),
    (4, 10);

-- Sample data for 'speel_geschiedenis' table
INSERT INTO speel_geschiedenis (gebruiker_ID, track_ID, speel_lengte, speel_datum) VALUES
    (1, 1, 235, '2024-03-01'),
    (2, 2, 255, '2024-03-02'),
    (3, 3, 198, '2024-03-03'),
    (4, 4, 398, '2024-03-04'),
    (5, 5, 369, '2024-03-05'),
    (6, 6, 170, '2024-03-06'),
    (7, 7, 221, '2024-03-07'),
    (8, 8, 588, '2024-03-08'),
    (9, 9, 177, '2024-03-09'),
    (10, 10, 272, '2024-03-10'),
    (10, 10, 272, '2024-03-10'),
    (10, 10, 272, '2024-03-10');


-- Sample data for 'library' table
INSERT INTO library (gebruiker_ID, link_ID, type) VALUES
    (1, 1, 'Track'),
    (1, 2, 'Track'),
    (2, 3, 'Track'),
    (3, 4, 'Album'),
    (4, 5, 'Track'),
    (5, 6, 'Album'),
    (6, 7, 'Track'),
    (7, 8, 'Album'),
    (8, 9, 'Playlist'),
    (9, 10, 'Track');