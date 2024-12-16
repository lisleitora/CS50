-- database: dese.db
SELECT * FROM districts AS d
JOIN expenditures AS e ON (e.district_id = d.id)
JOIN staff_evaluations AS se ON (se.district_id = d.id)

