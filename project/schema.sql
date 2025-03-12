
-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- <<<<<<<< tables section >>>>>>>>>

-- Drop tables and other stuff
DROP TABLE IF EXISTS "users";
DROP TABLE IF EXISTS "works";
DROP TABLE IF EXISTS "fandoms";
DROP TABLE IF EXISTS "bookmarked";
DROP TABLE IF EXISTS "collections";
DROP TABLE IF EXISTS "collection_contribuitors_connect";
DROP TABLE IF EXISTS "collection_works_connect";
VACUUM;


-- This table is the users data, and how they can log-in
CREATE TABLE IF NOT EXISTS "users"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
     "password" TEXT NOT NULL
);

-- This table organizes the data of the works (fanfiction or independent writing).
CREATE TABLE IF NOT EXISTS "works"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
-- The username and id of the author/creator of the work
    "author_id" INTEGER NOT NULL,
-- The work's title
    "work_name" TEXT NOT NULL,
-- The adequate age for reading the work,
-- as G means 'general', T means 'teen and up', M means 'Mature' and E means 'Explicit: only suitable for adults'.
    "rating" TEXT CHECK("rating" IN ('G', 'T', 'M', 'E', 'Uncategorized')),
-- The equivalent of likes for this platform
    "kudos" INTEGER DEFAULT 0,
-- If the work is already publhished in entirety or if it's ongoing/incomplete
    "is_finished" TEXT CHECK("is_finished" IN('Completed', 'Incomplete', 'Uncategorized')),
-- The type of romance that may be there:
-- F/F: would be female to female(e.g. lesbian), M/M: male to male(e.g. gay), F/M: female to male(e.g. hetero), Gen: romance is not the main topic or there is none, Multi: more than one partner or more than one type of relation, Other: Other relationships.
    "relationships" TEXT CHECK("relationships" IN('F/F', 'M/M', 'F/M', 'Gen', 'Multi', 'Other',  'Uncategorized')),
-- Warnings about what may you encounter on the work: graphic depictions of violence, major character death, rape/non-con, underage sex. The specific warnings can be written in the column.
    "warnings" TEXT,
-- The fandoms are a way of classifying the fanfiction, as most of it is based on published "official" works.
    "fandom_id" INTEGER,
-- The language in which the work is written.
    "language" TEXT NOT NULL,
-- how many users has the work reached.
    "hits" INTEGER DEFAULT 0,
-- The number of words the work has.
    "words" INTEGER NOT NULL,
-- How many chapters the work has.
    "chapters" INTEGER NOT NULL,
-- The date the work was firstly published.
    "creation_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- The last time it was updated
    "updated_at" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("author_id") REFERENCES "users"("id"),
    FOREIGN KEY("fandom_id") REFERENCES "fandoms"("id")
);

-- The fandoms table classifies fanfiction based on published/"official" works.
CREATE TABLE IF NOT EXISTS "fandoms"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    -- The name of the original work on which fanfiction authors can base their stories.
    "name" TEXT NOT NULL,
    -- The type of media the fandom belongs to.
    "category" TEXT NOT NULL CHECK("category" IN (
        'Anime & Manga', 'Books & Literature', 'Cartoons & Comics & Graphic Novels',
        'Movies', 'Celebrities & Real People', 'Music & Bands', 'Other Media',
        'Theater', 'TV Shows', 'Video Games', 'Uncategorized Fandoms'
    ))
);


-- The comments users can post about works.
CREATE TABLE IF NOT EXISTS "comments" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
-- The user who wrote the comment.
    "user_id" INTEGER NOT NULL,
-- The work which the user commented on.
    "work_id" INTEGER NOT NULL,
-- What the user wrote.
    "content" TEXT NOT NULL,
-- The chapter which the user commented on.
    "chapter" INTEGER NOT NULL,
-- When did the user comment.
    "created_at" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("work_id") REFERENCES "works"("id")
);

-- When a work is bookmarked by an user, it is linked to them so the user can find the work later.
CREATE TABLE IF NOT EXISTS "bookmarked"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
-- The id of who bookmarked the work.
    "user_id" INTEGER NOT NULL,
-- The work's id.
     "work_id" INTEGER NOT NULL,
FOREIGN KEY("user_id") REFERENCES "users"("id"),
FOREIGN KEY("work_id") REFERENCES "works"("id"),
FOREIGN KEY("collection_id") REFERENCES "collections"("id")
);

-- Collections are just like a spotify playlist; Users and authors can group some works as they please.
CREATE TABLE IF NOT EXISTS "collections"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
-- The collection name is created by the user as a way of personalising it, for example, 'chunkybanner56 favorite harry potter fanfics'.
    "name" TEXT NOT NULL,
-- The date when the collection was created.
    "creation_date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- The last time it was updated
    "updated_at" NUMERIC DEFAULT CURRENT_TIMESTAMP
);

-- Just a connection table for the collections table, merging it with the users who created the collection.
CREATE TABLE IF NOT EXISTS "collection_contribuitors_connect"(
    "contribuitor_id" INTEGER NOT NULL,
    "collection_id" INTEGER NOT NULL,
FOREIGN KEY("collection_id") REFERENCES "collections"("id"),
FOREIGN KEY("contribuitor_id") REFERENCES "users"("id")
);
-- A connection table for the collections table, merging it with the works inside the collection.
CREATE TABLE IF NOT EXISTS "collection_works_connect"(
    "work_id" INTEGER NOT NULL,
    "collection_id" INTEGER NOT NULL,
FOREIGN KEY("collection_id") REFERENCES "collections"("id"),
FOREIGN KEY("work_id") REFERENCES "works"("id")
);

CREATE TABLE IF NOT EXISTS "work_fandom_connect"(
    "work_id" INTEGER NOT NULL,
    "fandom_id" INTEGER NOT NULL,
FOREIGN KEY("fandom_id") REFERENCES "fandoms"("id"),
FOREIGN KEY("work_id") REFERENCES "works"("id")
);
-- <<<<<<<<<< indexes and views >>>>>>>>>>>>
-- users
CREATE UNIQUE INDEX idx_users_email ON users(email);
CREATE UNIQUE INDEX idx_users_username ON users(username);
-- works
CREATE INDEX idx_works_author_id ON works(author_id);
CREATE INDEX idx_works_fandom_id ON works(fandom_id);
CREATE INDEX idx_works_is_finished ON works(is_finished);
-- fandoms
CREATE UNIQUE INDEX idx_fandoms_name ON fandoms(name);
-- bookmarks
CREATE INDEX idx_bookmarked_user_id ON bookmarked(user_id);
CREATE INDEX idx_bookmarked_work_id ON bookmarked(work_id);
-- collections
CREATE INDEX idx_collections_name ON collections(name);
CREATE INDEX idx_collections_contribuitors ON collections(contribuitors_ids);
-- connection tables
CREATE INDEX idx_collection_works ON collection_works_connect(collection_id, work_id);


-- Now i'll put some sample data on the tables,
-- it's just a sample to make the database look more realistic, don't mind it!

-- <<<<<<<< users table >>>>>>>>>
INSERT INTO "users" ("email", "username", "password") VALUES
('alice@example.com', 'AliceInWords', 'hashed_pw_1'),
('bob@example.com', 'BobTheWriter', 'hashed_pw_2'),
('charlie@example.com', 'CharlieFic', 'hashed_pw_3'),
('diana@example.com', 'DianaDreams', 'hashed_pw_4'),
('ethan@example.com', 'EthanInFandom', 'hashed_pw_5'),
('fiona@example.com', 'FionaFiclover', 'hashed_pw_6'),
('george@example.com', 'GeorgeQuill', 'hashed_pw_7'),
('hannah@example.com', 'HannahStoryteller', 'hashed_pw_8'),
('ian@example.com', 'IanFiction', 'hashed_pw_9'),
('julia@example.com', 'JuliaWrites', 'hashed_pw_10'),
('kevin@example.com', 'KevinTales', 'hashed_pw_11'),
('lucas@example.com', 'LucasFandoms', 'hashed_pw_12'),
('mia@example.com', 'MiaFanfic', 'hashed_pw_13'),
('noah@example.com', 'NoahAuthor', 'hashed_pw_14'),
('olivia@example.com', 'OliviaNovels', 'hashed_pw_15'),
('peter@example.com', 'PeterStory', 'hashed_pw_16'),
('quinn@example.com', 'QuinnVerse', 'hashed_pw_17'),
('rachel@example.com', 'RachelWriter', 'hashed_pw_18'),
('sam@example.com', 'SamFics', 'hashed_pw_19'),
('tina@example.com', 'TinaTales', 'hashed_pw_20'),
('ursula@example.com', 'UrsulaFantasy', 'hashed_pw_21'),
('victor@example.com', 'VictorNarrator', 'hashed_pw_22'),
('will@example.com', 'WillWords', 'hashed_pw_23'),
('xena@example.com', 'XenaFanfic', 'hashed_pw_24'),
('yara@example.com', 'YaraPen', 'hashed_pw_25'),
('zane@example.com', 'ZaneFics', 'hashed_pw_26'),
('amy@example.com', 'AmyInFandoms', 'hashed_pw_27'),
('brian@example.com', 'BrianWrites', 'hashed_pw_28'),
('carl@example.com', 'CarlTheFan', 'hashed_pw_29'),
('daisy@example.com', 'DaisyStoryteller', 'hashed_pw_30'),
('elias@example.com', 'EliasDreamer', 'hashed_pw_31'),
('flora@example.com', 'FloraNarrative', 'hashed_pw_32'),
('gabe@example.com', 'GabeFandom', 'hashed_pw_33'),
('holly@example.com', 'HollyQuill', 'hashed_pw_34'),
('isaac@example.com', 'IsaacFantasy', 'hashed_pw_35'),
('jasmine@example.com', 'JasmineScribe', 'hashed_pw_36'),
('kyle@example.com', 'KyleWords', 'hashed_pw_37'),
('leo@example.com', 'LeoFanwriter', 'hashed_pw_38'),
('mila@example.com', 'MilaTales', 'hashed_pw_39'),
('nina@example.com', 'NinaFiction', 'hashed_pw_40'),
('oscar@example.com', 'OscarFan', 'hashed_pw_41'),
('paula@example.com', 'PaulaVerse', 'hashed_pw_42'),
('quentin@example.com', 'QuentinFic', 'hashed_pw_43'),
('rosie@example.com', 'RosieWrites', 'hashed_pw_44'),
('steven@example.com', 'StevenFandom', 'hashed_pw_45'),
('tara@example.com', 'TaraNovels', 'hashed_pw_46'),
('ulrich@example.com', 'UlrichStory', 'hashed_pw_47'),
('violet@example.com', 'VioletPen', 'hashed_pw_48'),
('walter@example.com', 'WalterFics', 'hashed_pw_49'),
('zoe@example.com', 'ZoeQuill', 'hashed_pw_50');

-- <<<<<<<< fandoms table >>>>>>>>>
INSERT INTO "fandoms" ("name", "category") VALUES
('Harry Potter', 'Books & Literature'),
('Lord of the Rings', 'Books & Literature'),
('Star Wars', 'Movies'),
('Marvel Universe', 'Movies'),
('Naruto', 'Anime & Manga'),
('Attack on Titan', 'Anime & Manga'),
('One Piece', 'Anime & Manga'),
('The Witcher', 'Books & Literature'),
('Game of Thrones', 'TV Shows'),
('Stranger Things', 'TV Shows'),
('Percy Jackson', 'Books & Literature'),
('Doctor Who', 'TV Shows'),
('Supernatural', 'TV Shows'),
('Sherlock Holmes', 'Books & Literature'),
('Avatar: The Last Airbender', 'Cartoons & Comics & Graphic Novels'),
('Final Fantasy', 'Video Games'),
('Dragon Age', 'Video Games'),
('Overwatch', 'Video Games'),
('Undertale', 'Video Games'),
('The Mandalorian', 'TV Shows'),
('Hunger Games', 'Books & Literature'),
('The 100', 'TV Shows'),
('The Walking Dead', 'TV Shows'),
('Breaking Bad', 'TV Shows'),
('Cyberpunk 2077', 'Video Games'),
('Danganronpa', 'Video Games'),
('Resident Evil', 'Video Games'),
('Death Note', 'Anime & Manga'),
('Fullmetal Alchemist', 'Anime & Manga'),
('Bleach', 'Anime & Manga'),
('Demon Slayer', 'Anime & Manga'),
('Chainsaw Man', 'Anime & Manga'),
('Tokyo Revengers', 'Anime & Manga'),
('Jujutsu Kaisen', 'Anime & Manga'),
('Black Clover', 'Anime & Manga'),
('Fairy Tail', 'Anime & Manga'),
('Shadowhunters', 'Books & Literature'),
('Twilight', 'Books & Literature'),
('The Chronicles of Narnia', 'Books & Literature'),
('The Maze Runner', 'Books & Literature'),
('Red Queen', 'Books & Literature'),
('The Selection', 'Books & Literature'),
('Horizon Zero Dawn', 'Video Games'),
('Assassin’s Creed', 'Video Games'),
('Bioshock', 'Video Games'),
('Fire Emblem', 'Video Games'),
('League of Legends', 'Video Games'),
('Minecraft', 'Video Games'),
('Five Nights at Freddy’s', 'Video Games'),
('My Hero Academia', 'Anime & Manga');
