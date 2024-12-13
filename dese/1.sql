-- database: dese.db
SELECT schools.name, schools.city FROM schools
JOIN districts ON (district_id = districts.id)
WHERE districts.state LIKE '%MA%'
AND districts.type NOT LIKE 'Charter School';

