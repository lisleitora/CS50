SELECT pe.year, pe.HR FROM performances AS pe
JOIN players AS pl ON (pl.id = pe.player_id)
WHERE pl.first_name = 'Ken'
AND pl.last_name = 'Griffin'
AND pl.birth_year
