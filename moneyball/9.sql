SELECT t.name, s.salary FROM team AS t
JOIN salaries AS s ON (s.team_id = t.id)
