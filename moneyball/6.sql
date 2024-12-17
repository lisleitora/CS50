-- database: moneyball.db
SELECT t.name, SUM(p.H + p.2B + p.3B) AS total_hits FROM teams AS t
JOIN performances AS p ON (t.id = pe.team_id)
WHERE p.year = '2001'
ORDER BY total_hits DESC
