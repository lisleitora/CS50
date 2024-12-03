-- database: views.db
SELECT entropy AS 'Maximum Contrast'
FROM views
WHERE artist = 'Hokusai'
ORDER BY entropy DESC
