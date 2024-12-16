-- database: dese.db
SELECT city, COUNT(schools.id) as count FROM schools
WHERE type = 'Public School' AND count >= 3
ORDER BY count, city
