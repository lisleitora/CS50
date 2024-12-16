-- database: dese.db
SELECT districts.name, per_pupil_expenditure FROM districts
JOIN expenditures ON (districts.id = expenditures.district_id)
GROUP BY districts.id
ORDER BY per_pupil_expenditure DESC
LIMIT 10
