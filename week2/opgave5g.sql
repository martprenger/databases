create user 'student'@'localhost' identified by 'password';

grant select on HBO_instelling.* to 'student'@'localhost';
grant insert, update on HBO_instelling.inschrijving to 'student'@'localhost';
