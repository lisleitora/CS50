-- database: dese.db
SELECT schools.name, schools.city FROM schools
JOIN districts ON (district_id = districts.id)
WHERE districts.name LIKE '%Massachusetts%'
AND districts.type NOT LIKE 'Charter School';

SELECT * FROM districts LIMIT 10;

SELECT * FROM schools LIMIT 10;
