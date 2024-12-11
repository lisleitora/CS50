-- database: packages.db

-- *** The Lost Letter ***

-- to discover the id of the woman who send the letter

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

SELECT address, type FROM addresses
WHERE id = '854';
-- result: 2 Finnigan Street, Residential


-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***

