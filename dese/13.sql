-- database: dese.db
SELECT s.name, e.per_pupil_expenditure FROM schools AS s
JOIN expenditures AS e ON (s.district_id = e.district_id)
WHERE s.city = 'New Bedford'
