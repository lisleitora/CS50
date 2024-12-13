-- database: dese.db
SELECT schools.name, schools.city, districts.name FROM schools
JOIN districts ON (district_id = districts.id)
WHERE districts.name LIKE '%Ma%'
-- AND districts.type NOT LIKE 'Charter School'
