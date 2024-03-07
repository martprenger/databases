use HBO_instelling;

-- Insert data into the student table
insert into student (student_nummer, voornaam, achternaam, geboortedatum, start_jaar)
values
    (12345, 'John', 'Doe', '1990-01-01', '2020-09-01'),
    (54321, 'Jane', 'Smith', '1992-05-15', '2020-09-01');

-- Insert data into the thema table
insert into thema (naam, credits, jaar, periode)
values
    ('Programming', 6, '2020-09-01', '2020-09-01'),
    ('Database Management', 6, '2020-09-01', '2020-09-01');

-- Insert data into the module table
insert into module (naam, credits, jaar, periode)
values
    ('Programming Fundamentals', 3, '2020-09-01', '2020-09-01'),
    ('Databases', 3, '2020-09-01', '2020-09-01');

-- Insert data into the toets table
insert into HBO_instelling.toets (credits)
values (3), (2);

-- Insert data into the thema_module table
insert into thema_module (thema_ID, module_ID)
values
    (1, 1),
    (2, 2);

-- Insert data into the inschrijving table
insert into inschrijving (student_ID, thema_ID, jaar, periode)
values
    (1, 1, '2020-09-01', '2020-09-01'),
    (2, 2, '2020-09-01', '2020-09-01'
    );

-- Insert data into the module_toets table
insert into module_toets (module_ID, toets_ID)
values
    (1, 1),
    (2, 2);

-- Insert data into the resultaat table
insert into resultaat (toets_ID, student_ID, cijfer)
values
    (1, 1, 8),
    (2, 2, 7);
