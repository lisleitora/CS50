-- database: dese.db
SELECT schools.name, per_pupil_expenditure FROM schools
JOIN expenditures ON (schools.district_id = expenditures.district_id)
JOIN graduation_rates
ORDER BY per_pupil_expenditure DESC, schools.name
