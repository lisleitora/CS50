SELECT pl.first_name, pl.last_name, s.salary/pe.H AS dollars_per_hit
FROM player AS pl
JOIN salaries AS s ON (s.player_id = pl.id)
JOIN performances AS pe ON ()
