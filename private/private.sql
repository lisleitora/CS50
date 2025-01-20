-- database: private.db
CREATE TABLE "users"(
 "id" INTEGER NOT NULL,
    "sentence" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
PRIMARY KEY("username")
);


CREATE VIEW "message" AS
SELECT substr("message_id", "character", "size")
 FROM cleaned_sentences;
