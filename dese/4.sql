-- database: dese.db
SELECT city FROM schools
WHERE type NOT LIKE 'Charter%'
ORDER BY COUNT(id)
ORDER BY name
