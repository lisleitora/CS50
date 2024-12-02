-- database: cyberchase.db
SELECT * FROM episodes
WHERE title LIKE '%code%'
AND topic LIKE '%code%'
OR title LIKE '%SQL%'
