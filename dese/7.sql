-- database: dese.db
SELECT name FROM schools
JOIN districts ON (district_id = districts.id)
WHERE city LIKE '%cambridge%'
AND name LIKE '%cambridge%'
