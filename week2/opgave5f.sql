select s.voornaam, s.achternaam, r.cijfer
from student s
    join inschrijving i on s.student_ID = i.student_ID
    join thema t on i.thema_ID = t.thema_ID
    join thema_module tm on t.thema_ID = tm.thema_ID
    join module m on tm.module_ID = m.module_ID
    join module_toets mt on m.module_ID = mt.module_ID
    join toets tt on mt.toets_ID = tt.toets_ID
    join resultaat r on r.toets_ID = tt.toets_ID

    where YEAR(s.start_jaar) = 2020 and m.naam = 'Databases'
    order by r.cijfer desc;