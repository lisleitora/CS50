-- database: snap.db
SELECT id FROM users
JOIN friends ON(friends.user_id == users.id)
WHERE friends.friend_id = (SELECT id FROM users
WHERE username = 'exceptionalinspiration482')
 INTERSECT
SELECT id FROM users
JOIN friends ON(friends.user_id == users.id)
WHERE friends.friend_id = (SELECT id FROM users
WHERE username = 'lovelytrust487');
