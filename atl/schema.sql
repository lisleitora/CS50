CREATE TABLE "passengers"(
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" NOT NULL INTEGER
);

CREATE TABLE "check_in"(
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight" INTEGER NOT NULL
);

CREATE TABLE "airlines"(
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
    PRIMARY KEY("name")
)

CREATE TABLE "flights"(
    "flight_number" INTEGER NOT NULL,
    "airline" TEXT NOT NULL,
    "from_airport" TEXT NOT NULL,
    "to_airport" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "arrival_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY("flight_number"),
    FOREIGN KEY("airline") REFERENCES "airlines"("name")
)
