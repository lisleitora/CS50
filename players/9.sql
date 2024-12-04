-- database: players.db
SELECT * FROM players
WHERE final_game LIKE '%2022%'
ORDER BY first_name, last_name
