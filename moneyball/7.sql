-- database: moneyball.db
SELECT p.first_name, p.last_name FROM players AS p
JOIN salaries AS s ON (s.player_id = p.id)
ORDER BY salary
LIMIT 1
