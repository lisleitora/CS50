-- database: moneyball.db
SELECT p.first_name, p.last_name, salary FROM salaries AS s
JOIN players AS p ON (s.player_id = p.id)
ORDER BY salary, p.first_name, p.last_name, p.id
LIMIT 50
