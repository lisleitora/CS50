-- database: moneyball.db
SELECT t.name, SUM(p.H + p.`2B` + p.`3B` + p.HR + p.RBI) AS total_hits FROM teams AS t
JOIN performances AS p ON (t.id = p.team_id)
WHERE p.year = '2001'
GROUP BY t.name
ORDER BY total_hits DESC
LIMIT 5
