SELECT schools.name, per_pupil_expenditure FROM schools
JOIN expenditures ON (schools.district_id = expenditures.district_id)
