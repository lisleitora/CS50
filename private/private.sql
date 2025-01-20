-- database: private.db

CREATE VIEW "message" AS
SELECT substr("message_id", "character", "size")
 FROM sentences;

SELECT sentence FROM sentences;
