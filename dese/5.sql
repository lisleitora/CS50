-- database: dese.db
SELECT city, COUNT(schools.id) as count FROM schools
WHERE type = 'Public School'
GROUP BY city
HAVING count <= 3
ORDER BY count DESC, city
