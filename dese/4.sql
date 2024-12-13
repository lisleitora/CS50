-- database: dese.db
SELECT city, COUNT(id) as count FROM schools
JOIN districts ON 
WHERE type NOT LIKE 'Charter%'
ORDER BY count
LIMIT 10
