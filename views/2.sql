-- database: views.db
SELECT average_color FROM views
WHERE english_title LIKE '%river%'
AND average_color NOT LIKE '%00'
AND artist = 'Hokusai'
