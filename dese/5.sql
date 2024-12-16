-- database: dese.db
SELECT city, COUNT(schools.id) as count FROM schools
WHERE type = 'Public School'
AND count 
GROUP BY city
ORDER BY count DESC, city
