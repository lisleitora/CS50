-- database: moneyball.db
SELECT t.name, AVG(s.salary)  FROM teams AS t
JOIN salaries AS s ON (s.team_id = t.id)
GROUP BY t.name
ORDER BY salary
LIMIT 5
