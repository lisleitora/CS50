-- database: moneyball.db
SELECT p.first_name, p.last_name, salary FROM players AS p
JOIN salaries AS s ON (s.player_id = p.id)
WHERE s.year = '2001'
ORDER BY salary, p.first_name, p.last_name, p.id
LIMIT 50
