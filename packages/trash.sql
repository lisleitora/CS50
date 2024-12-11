-- database: packages.db

SELECT * FROM packages
WHERE contents LIKE '%duck%'
AND from_address_id IS NULL;
-- to address id: 50,
SELECT * FROM addresses
WHERE id = '50'
