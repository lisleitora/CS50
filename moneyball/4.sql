SELECT year, salary FROM salaries AS s
JOIN players AS p ON (s.player_id = p.id)
ORDER BY 
