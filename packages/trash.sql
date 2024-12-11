-- database: packages.db
-- SELECT * FROM addresses
-- WHERE address LIKE '%2%Finnegan%Street%uptown%'

SELECT * FROM packages
WHERE from_address_id = '900 Somerville Avenue'
-- 432
SELECT * FROM packages
WHERE from_address_id = '432'
