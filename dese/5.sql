-- database: dese.db
SELECT city, COUNT(schools.id) as count FROM schools
WHERE type = 'Public School'
ORDER BY count, city
