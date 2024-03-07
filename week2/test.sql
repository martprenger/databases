SELECT s.voornaam, s.achternaam, r.cijfer
FROM HBO_instelling.student s
         JOIN HBO_instelling.resultaat r ON s.student_ID = r.student_ID
         JOIN HBO_instelling.toets t ON r.toets_ID = t.toets_ID
         JOIN HBO_instelling.module_toets mt ON t.toets_ID = mt.toets_ID
         JOIN HBO_instelling.module m ON mt.module_ID = m.module_ID
WHERE s.start_jaar = '2020-09-01' AND m.naam = 'Databases'
ORDER BY r.cijfer DESC;