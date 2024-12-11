-- database: packages.db
-- SELECT * FROM addresses
-- WHERE address LIKE '%2%Finnegan%Street%uptown%'

SELECT id FROM addresses
WHERE address LIKE '900 Somerville Avenue'
-- result address id: 432

SELECT * FROM packages
WHERE from_address_id = '432'
