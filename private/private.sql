-- database: private.db
CREATE TABLE "cleaned_sentences"(
 "id" INTEGER NOT NULL,
    "sentence" TEXT NOT NULL,
    "first_character" INTEGER NOT NULL,
    "length" INTEGER NOT NULL,
PRIMARY KEY("id")
);

INSERT INTO cleaned_sentences (id, sentence)
SELECT
    CASE
        WHERE id IN(),
FROM sentences;

CREATE VIEW "message" AS
SELECT substr("sentence", "character", "length") AS "phrase"
 FROM cleaned_sentences;

SELECT "phrase" FROM "message";
