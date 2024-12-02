-- database: cyberchase.db
SELECT COUNT(id) FROM episodes
WHERE air_date BETWEEN '2002%' AND '2007%'
