-- database: players.db
SELECT first_name, last_name, debut FROM players
WHERE birth_city = '' AND birth_state = 'PA'
ORDER BY first_name, last_name
