-- database: dese.db
SELECT schools.name, pupils FROM schools
JOIN expenditures ON (schools.district_id = expenditures.district_id)
JOIN districts ON (districts.id = schools.district_id)
GROUP BY districts.id
ORDER BY 
