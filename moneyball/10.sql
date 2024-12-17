-- database: moneyball.db
SELECT pl.first_name,
 pl.last_name,
 s.salary,
 pe.HR, s.year FROM players AS pl
JOIN salaries AS s ON (s.player_id = pl.id)
JOIN performances AS pe ON (pe.player_id = pl.id
AND s.year = pe.year)
ORDER BY pl.id, s.year DESC, pe.HR DESC, s.salary DESC
