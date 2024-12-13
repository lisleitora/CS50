-- database: dese.db
SELECT city, COUNT(schools.id) as count FROM schools
JOIN districts ON (district_id = districts.id)
WHERE type NOT LIKE 'Charter%'
ORDER BY count
LIMIT 10
