-- database: packages.db
SELECT type FROM address
JOIN scans ON (address.id = address_id)
JOIN packages ON (packages.id = package_id)
WHERE from_address_id = '900 Somerville Avenue'
AND to_address_id = '2 Finnegan Street, uptown'
