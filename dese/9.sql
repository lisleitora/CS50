-- database: dese.db
SELECT districts.name FROM districts
JOIN expenditures ON (districts.id = expenditures.district_id)
GROUP BY districts.id
ORDER BY pupils
LIMIT 1
