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

-- to discover the id of the address

SELECT * FROM packages
WHERE contents LIKE '%duck%'
AND from_address_id IS NULL;
-- to address id: 50,
SELECT * FROM addresses
WHERE id = '50';
-- package id : 5098
-- result 50,123 Sesame Street,Residential
-- p.s. i LOVED that the duck was for Ernie (sesame street) SERIOUSLY!!! A-M-A-Z-I-N-G

SELECT * FROM scans
WHERE scans.package_id = '5098' AND action = 'Drop';
-- address id 348

SELECT * FROM addresses
WHERE id = '348';
-- address : 348,7 Humboldt Place,Police Station

-- *** The Forgotten Gift ***

-- to discover the id of the address

SELECT * FROM addresses
WHERE address LIKE '109 Tileston Street';
--FROM address id 9873
-- result: 4983 and 9873

SELECT * FROM packages
WHERE from_address_id = '9873';
-- Flowers
-- package id: 9523

SELECT * FROM scans
WHERE scans.package_id = '9523' AND action = 'Drop';
-- address id 7432



SELECT * FROM addresses
WHERE id = '7432';


