-- database: cyberchase.db
SELECT COUNT(id) FROM episodes
WHERE air_date BETWEEN '2018%' AND '2023%'
