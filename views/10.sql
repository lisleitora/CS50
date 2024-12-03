-- database: views.db
SELECT id, english_title AS 'ENG title', japanese_title AS 'JP title', artist AS 'creator', average_color AS 'AVG color', brightness, contrast, entropy
FROM views
WHERE english_title LIKE '%mount%'
ORDER BY japanese_title
