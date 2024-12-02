-- database: cyberchase.db
SELECT title, topic FROM episodes
WHERE season = 6 AND air_date LIKE '2007%'
