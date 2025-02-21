-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- This query may be used when an user tries to log in the site.
SELECT * FROM users
WHERE username = 'ReaderOfAllSins'
OR email = 'ReaderOfAllSins@email.com';

-- This filters only the works of an specific author.
SELECT * FROM works
WHERE author_id = (SELECT id FROM users WHERE username = 'ReaderOfAllSins');

-- This filters only works of an specific fandom.
SELECT w.* FROM works w
JOIN fandoms f ON w.fandom_id = f.id
WHERE f.name = 'Harry Potter';

-- This one is filtering works that are completed and for adults.
SELECT * FROM works
WHERE is_finished = 'Completed'
AND rating = 'E';

-- This filters works that only have hetero relationships.
SELECT * FROM works
WHERE relationships = 'F/M';

-- This query gathers the 10 most liked works, or in other words, the top 10.
SELECT * FROM works
ORDER BY kudos DESC
LIMIT 10;

-- This query, similarly to the one above, gets the 10 most recent works.
SELECT * FROM works
ORDER BY creation_date DESC
LIMIT 10;

-- With this we'll see all the works of an determined collection.
SELECT w.* FROM works w
JOIN collection_works_connect cwc ON w.id = cwc.work_id
WHERE cwc.collection_id = (SELECT id FROM collections WHERE name = 'Best Harry Potter Fanfics');

-- Here we can see all the bookmarked works of the user 'fanficlover99'.
SELECT w.* FROM works w
JOIN bookmarked b ON w.id = b.work_id
WHERE b.user_id = (SELECT id FROM users WHERE username = 'ReaderOfAllSins');

-- On this query we can see how many works each fandom has, ordered by most to least.
SELECT f.name, COUNT(w.id) AS total_works
FROM fandoms f
LEFT JOIN works w ON f.id = w.fandom_id
GROUP BY f.name
ORDER BY total_works DESC;
