SELECT schools.name FROM schools
JOIN expenditure ON (schools.district_id = expenditure.district_id)
