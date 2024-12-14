-- database: dese.db
SELECT districts.city, COUNT(schools.id) as count FROM schools
JOIN districts ON (district_id = districts.id)
WHERE schools.type LIKE '%Public%'
GROUP BY districts.city
ORDER BY count DESC, districts.city
LIMIT 10
