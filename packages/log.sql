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
SELECT * FROM packages
WHERE contents LIKE '%duck%'
AND from_address_id IS NULL;
-- to address id: 50,
SELECT * FROM addresses
WHERE id = '50'
-- result 50,123 Sesame Street,Residential
-- p.s. i LOVED that the duck was for Ernie (sesame street) SERIOUSLY!!! A-M-A-Z-I-N-G
-- *** The Forgotten Gift ***

SELECT id FROM addresses
WHERE address LIKE '728 Maple Place'
OR address LIKE '109 Tileston Street';
-- result: 4983 and 9873

SELECT * FROM packages
WHERE from_address_id = '4983';
-- to_address_id: 4425

SELECT * FROM addresses
WHERE id = '4425';

SELECT * FROM packages
WHERE from_address_id IS NULL;
-- AND from_address_id IS NULL;
