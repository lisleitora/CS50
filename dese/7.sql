-- database: dese.db
SELECT name FROM schools
JOIN districts
WHERE city LIKE '%cambridge%'
