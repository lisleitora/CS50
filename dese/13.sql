-- database: dese.db
SELECT schools.name, per_pupil_expenditure FROM schools AS s
JOIN expenditures ON (schools.district_id = expenditures.district_id)
WHERE s.city LIKE 'New York%'
