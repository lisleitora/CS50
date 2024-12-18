-- database: moneyball.db
SELECT pl.first_name, pl.last_name FROM players AS pl
JOIN salaries AS s ON (s.player_id = pl.id)
JOIN performances AS pe ON (pe.player_id = pl.id
AND pe.year = s.year)WHERE pe.year = '2001'
AND pe.H NOT LIKE '0'
ORDER BY s.salary/pe.H AS dollars_per_hit, pl.id
LIMIT 10
