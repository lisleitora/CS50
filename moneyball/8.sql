SELECT salary FROM salaries AS s
JOIN performances AS p ON (p.player_id = s.player_id)
