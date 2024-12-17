SELECT t.name, SUM(p.H, p.2B, p.3B) FROM teams AS t
JOIN performances AS pe ON (t.id = pe.team_id)
