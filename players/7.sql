-- database: players.db
SELECT first_name, last_name FROM players
WHERE bats = 'R' AND throws = 'L'
OR bats = 'L' AND throws = 'R'
ORDER BY first_name, last_name
