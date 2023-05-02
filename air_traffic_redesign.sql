DROP DATABASE IF EXISTS air_traffic_redesign;

CREATE DATABASE air_traffic_redesign;

\c air_traffic_redesign

CREATE TABLE "passenger" (
    "id" integer  ,
    "first_name" varchar(200)  ,
    "last_name" varchar(200)  ,
    "seat" varchar(10)  ,
    "departure" timestamp  ,
    "arrival" timestamp  ,
    "airline_id" int  ,
    "origin_id" int  ,
    "from_country" int  ,
    "destination_id" int  ,
    "to_country" int  ,
    CONSTRAINT "pk_passenger" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "airline" (
    "id" integer  ,
    "name" varchar(200)  ,
    CONSTRAINT "pk_airline" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "country" (
    "id" integer  ,
    "name" varchar(200)  ,
    CONSTRAINT "pk_country" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "city" (
    "id" integer  ,
    "name" varchar(200)  ,
    CONSTRAINT "pk_city" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_airline_id" FOREIGN KEY("airline_id")
REFERENCES "airline" ("id");

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_origin_id" FOREIGN KEY("origin_id")
REFERENCES "city" ("id");

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_destination_id" FOREIGN KEY("destination_id")
REFERENCES "city" ("id");

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_from_country" FOREIGN KEY("from_country")
REFERENCES "country" ("id");

ALTER TABLE "passenger" ADD CONSTRAINT "fk_passenger_to_country" FOREIGN KEY("to_country")
REFERENCES "country" ("id");



INSERT INTO airline (id, name)
VALUES
(1, 'United'),
(2, 'British Airways'),
(3, 'Delta'),
(4, 'TUI Fly Belgium'),
(5, 'Air China'),
(6, 'American Airlines'),
(7, 'Avianca Brasil');


INSERT INTO country (id, name)
VALUES
(1, 'United States'),
(2, 'United Kingdom'),
(3, 'Mexico'),
(4, 'Morocco'),
(5, 'China'),
(6, 'Chile'),
(7, 'Japan'),
(8, 'France'),
(9, 'UAE'),
(10, 'Brazil');


INSERT INTO city (id, name)
VALUES
(1,'Washington DC'),
(2, 'Tokyo'),
(3, 'Los Angeles'),
(4, 'Seattle'),
(5, 'Paris'),
(6, 'Dubai'),
(7, 'New York'),
(8, 'Cedar Rapids'),
(9, 'Charlotte'),
(10, 'Sao Paolo'),
(11, 'London'),
(12, 'Las Vegas'),
(13, 'Mexico City'),
(14, 'Casablanca'),
(15, 'Beijing'),
(16, 'Chicago'),
(17, 'New Orleans'),
(18, 'Santiago');

INSERT INTO passenger
(   id,
    first_name,
    last_name,
    seat ,
    departure ,
    arrival ,
    airline_id ,
    origin_id,
    from_country,
    destination_id,
    to_country
)

VALUES 
 (1, 'Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 4, 1),
 (2, 'Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 2, 7, 8, 2),
 (3, 'Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 3, 1, 12, 1),
 (4, 'Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 4, 1, 13, 3),
 (5, 'Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 5, 8, 14, 4),
 (6, 'Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 6, 9, 15, 5),
 (7, 'Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 7, 1, 9, 1),
 (8, 'Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 8, 1, 16, 1),
 (9, 'Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 9, 1, 17, 1),
 (10, 'Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 10, 10, 18, 6);
