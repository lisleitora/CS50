SELECT pl.first_name,
 pl.last_name,
 s.salary,
 pe.HR, .year FROM players AS pl
JOIN salaries AS s ON (s.player_id = pl.id)
