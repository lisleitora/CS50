-- database: dese.db
SELECT * FROM districts AS d
JOIN expenditures AS e ON (e.district_id = d.id)
JOIN staff_evaluations AS se ON (se.district_id = d.id)
WHERE d.type = 'Public School District'
AND se.exemplary > (
 SELECT AVG(exemplary)
 FROM staff_evaluations)
 AND e.per_pupil_expenditure > (
 SELECT AVG(per_pupil_expenditure)
 FROM expenditures)
