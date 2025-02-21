CREATE TABLE "users"(
 "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "password" VARCHAR(128) NOT NULL,
PRIMARY KEY("username")
);

CREATE TABLE "schools"(
    "name" VARCHAR(100) NOT NULL,
    "type" ENUM( 'Primary', 'Secondary', 'Higher Education') NOT NULL,
    "location" VARCHAR(100) NOT NULL,
    "founding_yr" SMALLINT NOT NULL,
PRIMARY KEY("name")
);

CREATE TABLE "companies"(
    "name" VARCHAR(100) NOT NULL,
    "industry" ENUM( 'Technology', 'Education', 'Business') NOT NULL,
    "location" VARCHAR(100) NOT NULL,
    PRIMARY KEY("name")
);

CREATE TABLE "user_connections"(
    "username1" VARCHAR(50) NOT NULL,
    "username2" VARCHAR(50) NOT NULL,
    FOREIGN KEY("username1") REFERENCES "users"("username")
    FOREIGN KEY("username2") REFERENCES "users"("username")
);

CREATE TABLE "school_connections"(
    "school_name" VARCHAR(100) NOT NULL,
    "user_name" VARCHAR(100) NOT NULL,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "degree" VARCHAR(50),
    FOREIGN KEY("user_name") REFERENCES "users"("username")
    FOREIGN KEY("school_name") REFERENCES "schools"("name")
);

CREATE TABLE "company_connections"(
    "company_name" VARCHAR(100) NOT NULL,
    "user_name" VARCHAR(50) NOT NULL,
    "start_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "end_date" NUMERIC DEFAULT CURRENT_TIMESTAMP,
    "user_title" VARCHAR(100) NOT NULL,
    FOREIGN KEY("user_name") REFERENCES "users"("username")
    FOREIGN KEY("company_name") REFERENCES "companies"("name")
);
