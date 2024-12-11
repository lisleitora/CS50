-- database: packages.db
SELECT id FROM addresses
WHERE address LIKE '728 Maple Place'
OR address LIKE '109 Tileston Street';
-- result: 4983 and 9873

SELECT id FROM packages
WHERE from_address_id = '4983'
AND to_address_id = '9873';
