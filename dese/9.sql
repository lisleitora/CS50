SELECT districts.name, pupils FROM districts
JOIN expenditures ON (districts.id = expenditures.district_id)
GROUP BY districts.id
ORDER BY pupils DESC
