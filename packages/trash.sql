-- database: packages.db
SELECT * FROM addresses
WHERE address LIKE '%ville%';

SELECT * FROM packages
WHERE contents LIKE '%duck%'
AND from_address_id IS NULL;
