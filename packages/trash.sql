-- database: packages.db

SELECT id FROM addresses
WHERE address LIKE '900 Somerville Avenue';
-- result address id: 432

SELECT id FROM packages
WHERE from_address_id = '432'
AND contents LIKE '%Congratulatory%';
-- resutl packge id: 384

SELECT * FROM scans
WHERE scans.package_id = '384'
AND action = 'Drop';
-- result address id:854

SELECT * FROM addresses
WHERE id = '854';
