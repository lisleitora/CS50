-- database: moneyball.db
SELECT t.name, ROUND(AVG(s.salary), 2) AS "average salary"
FROM teams AS t
JOIN salaries AS s ON (s.team_id = t.id)
WHERE t.year = '2001'
GROUP BY t.name
ORDER BY "average salary"
LIMIT 5
