-- database: packages.db
SELECT id FROM packages
JOIN addresses ON (packages.id = package_id)
JOIN scans ON (addresses.id = address_id)
WHERE from_address_id = '900 Somerville Avenue'
AND to_address_id = '2 Finnegan Street'
