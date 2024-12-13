-- database: dese.db
SELECT name, city FROM schools
JOIN districts ON (district_id = districts.id)
WHERE districts.name LIKE '%Massachusetts%'
AND type
