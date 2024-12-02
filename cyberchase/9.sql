-- database: cyberchase.db
SELECT COUNT(id) FROM episodes
WHERE air_date BETWEEN '20%' AND '2023%'
