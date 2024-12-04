-- database: players.db
SELECT COUNT(id) FROM players
WHERE bats = 'R' AND throws = 'L'
XOR bats = 'L' AND throws = 'R'
