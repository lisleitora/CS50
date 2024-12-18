SELECT pl.first_name, pl.last_name, s.salary/pe.H AS dollars_per_hit
FROM player AS pl
JOIN salaries AS s ON (s.player_id = pl.id)
JOIN performances AS pe ON (pe.player_id = pl.id
AND pe.year = s.year)
-- you false bitch motherfuckin dog go back to hell you fucking viper, you traitor, you damn dirty criminal, how dare you to jump off me 5 seconds after you came, you just wanted me for the cookies huh? you look at me with those (literal) puppy eyes... fuckin cute dog imma give ya more food. you greedy bastard. why you must be so cute?
-- she ate my food. when i had no more, she left. its always like this. she does bad things, pees in the carpet, but then, THEN she looks at me with those eyes and i absolutely cant do anything because of her cuteness. one day i will overcome my primal instincts to praise babies cats and dogs and ignoring your overwhelming cuteness, i will make justice.
-- one day, no treats will be served. (how does my mom resist you? is she not human?)
WHERE pe.year = '2001'
AND pe.H NOT LIKE '0'
ORDER BY dollars_per_hit, pl.first_name, pl.last_name
LIMIT 10
