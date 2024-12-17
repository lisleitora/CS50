-- database: moneyball.db
SELECT pe.year, pe.HR FROM performances AS pe
JOIN players AS pl ON (pl.id = pe.player_id)
WHERE pl.first_name = 'Ken'
AND pl.last_name = 'Griffey'
AND pl.birth_year = '1969'
ORDER BY pe.year DESC
