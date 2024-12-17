-- database: moneyball.db
SELECT t.name, s.salary FROM teams AS t
JOIN salaries AS s ON (s.team_id = t.id)
ORDER BY salary
LIMIT 5
