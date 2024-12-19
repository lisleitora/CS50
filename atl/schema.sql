CREATE TABLE "passengers"(
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER
);

CREATE TABLE "check_in"(
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight" INTEGER NOT NULL
);

CREATE TABLE "airlines"(
    "name" TEXT NOT NULL
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
)
