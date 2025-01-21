-- database: private.db
CREATE TABLE "cleaned_sentences"(
 "id" INTEGER,
    "sentence" TEXT,
    "first_character" INTEGER,
    "length" INTEGER,
    PRIMARY KEY(id)
);

INSERT INTO cleaned_sentences (id, sentence)
SELECT sentences.id, sentences.sentence
FROM sentences
WHERE id IN (14, 114, 618, 630, 932, 2230, 2346, 3041);

    REPLACE INTO cleaned_sentences (id, first_character, length)
VALUES
    (14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5)
    ON CONFLICT (id)
DO UPDATE SET
    first_character = excluded.first_character,
    length = excluded.length;

CREATE VIEW "message" AS
SELECT substr(sentence, first_character, length) AS "phrase"
 FROM cleaned_sentences;

SELECT "phrase" FROM "message";
