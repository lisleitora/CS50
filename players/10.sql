SELECT id, first_name AS 'first name', last_name AS 'last name', bats, throws, weight as 'weight', height, debut, final_game, birth_year, birth_month, birth_day, birth_city, birth_state, birth_country FROM players
WHERE id LIKE 
ORDER BY first_name, last_name
