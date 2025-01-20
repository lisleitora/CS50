CREATE TABLE "ingredients"(
    "name" TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL,
    PRIMARY KEY("name")
);

CREATE TABLE "donuts"(
    "name" TEXT NOT NULL,
    "is_gluten_free" TEXT NOT NULL CHECK("is_gluten_free" IN ('yes', 'no')),
    "price" REAL NOT NULL,
    "ingredients" TEXT NOT NULL,
    PRIMARY KEY("name"),
    FOREIGN KEY("ingredients") REFERENCES "ingredients"("name")
);

CREATE TABLE "orders"(
    "id" INTEGER NOT NULL,
    "donuts" TEXT NOT NULL,
    "costumer_id" INTEGER NOT NULL,
    "costumer_first_name" TEXT,
    "costumer_last_name" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY("donuts") REFERENCES "donuts"("name"),
    FOREIGN KEY("costumer_id") REFERENCES "costumers"("id"),
    FOREIGN KEY("costumer_first_name") REFERENCES "costumers"("first_name"),
    FOREIGN KEY("costumer_last_name") REFERENCES "costumers"("last_name")
);

CREATE TABLE "costumers"(
    "id" INTEGER NOT NULL,
   "first_name" TEXT,
   "last_name" TEXT,
   "orders" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("orders") REFERENCES "orders"("id")
);
