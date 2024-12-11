-- database: packages.db
SELECT id FROM addresses
WHERE address LIKE '728 Maple Place'
OR address LIKE '109 Tileston Street';
-- result: 4983 and 9873

SELECT * FROM packages
WHERE from_address_id = ''
AND to_address_id = '';
