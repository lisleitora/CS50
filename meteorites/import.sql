-- database: meteorites.db
CREATE TABLE "meteorites_temp" (
    "name" TEXT,
    "id" INTEGER,
    "nametype" TEXT,
    "class" TEXT,
    "mass" REAL,
    "discovery" TEXT,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

CREATE TABLE meteorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    class TEXT NOT NULL,
    mass REAL,
    discovery TEXT NOT NULL,
    year INTEGER,
    lat REAL,
    long REAL
);

.mode csv
.separator ,
.import meteorites.csv meteorites_temp
        
INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)

SELECT
    name,
    class,
    CASE
        WHEN mass = '' THEN NULL
        ELSE ROUND(mass, 2)
    END AS mass,
    discovery,
    CASE
        WHEN year = '' THEN NULL
        ELSE year
    END AS year,
    CASE
        WHEN lat = '' THEN NULL
        ELSE ROUND(lat, 2)
    END AS lat,
    CASE
        WHEN long = '' THEN NULL
        ELSE ROUND(long, 2)
    END AS long
FROM meteorites_temp
WHERE name <> 'name' AND nametype <> 'Relict'
ORDER BY year, name;

--SELECT * FROM meteorites;
--DROP TABLE "meteorites_temp";
--SELECT DISTINCT discovery FROM meteorites_temp;
