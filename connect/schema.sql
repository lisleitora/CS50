CREATE TABLE "users"(
 "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
PRIMARY KEY("username")
);

CREATE TABLE "schools"(
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founding_yr" INTEGER NOT NULL,
PRIMARY KEY("name")
);

CREATE TABLE "companies"(
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY("name")
);

CREATE TABLE "user_connections"(
    "username1" TEXT NOT NULL,
    "username2" TEXT NOT NULL,
    FOREIGN KEY("username1") REFERENCES "users"("username")
    FOREIGN KEY("username2") REFERENCES "users"("username")
);

CREATE TABLE "school_connections"(
    "school_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "degree" TEXT,
    FOREIGN KEY("user_name") REFERENCES "users"("username")
    FOREIGN KEY("school_name") REFERENCES "schools"("name")
);

CREATE TABLE "company_connections"(
    "company_name" TEXT NOT NULL,
    "user_name" TEXT NOT NULL,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "user_title" TEXT NOT NULL,
    FOREIGN KEY("user_name") REFERENCES "users"("username")
    FOREIGN KEY("company_name") REFERENCES "companies"("name")
);
