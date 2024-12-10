-- database: packages.db
SELECT * FROM addresses
WHERE address = '900 Somerville Avenue'
OR address LIKE '%2 Finnegan Street%'
