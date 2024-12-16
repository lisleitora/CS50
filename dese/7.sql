-- database: dese.db
SELECT schools.name FROM schools
JOIN districts ON (district_id = districts.id)
WHERE schools.city LIKE '%cambridge%'
AND districts.name LIKE '%cambridge%'
