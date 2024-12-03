-- database: views.db
SELECT artist, english_title FROM views
WHERE brightness = MAX(brightness)
