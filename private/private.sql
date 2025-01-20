-- database: private.db
CREATE TABLE "users"(
 "id" INTEGER NOT NULL,
    "sentence" TEXT NOT NULL,
    "first_character" INTEGER NOT NULL,
    "length" INTEGER NOT NULL,
PRIMARY KEY("id")
);


CREATE VIEW "message" AS
SELECT substr("sentence", "character", "length") AS "phrase"
 FROM cleaned_sentences;

SELECT "phrase" FROM "message";
