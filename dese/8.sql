SELECT schools.name FROM schools
JOIN expenditure ON (district_id = districts.id)
