-- database: private.db
CREATE TABLE "users"(
 "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
PRIMARY KEY("username")
);


CREATE VIEW "message" AS
SELECT substr("message_id", "character", "size")
 FROM cleaned_sentences;
