-- database: moneyball.db
SELECT t.name, ROUND(AVG(s.salary), 2) AS average_salary FROM teams AS t
JOIN salaries AS s ON (s.team_id = t.id)
GROUP BY t.name
ORDER BY average_salary
LIMIT 5
