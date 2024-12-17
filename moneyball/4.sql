SELECT pe.year, pe.HR FROM performances AS pe
JOIN players AS pl ON (pl.id = pe.player_id)
