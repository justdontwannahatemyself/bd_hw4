CREATE TABLE "City" (
  "Name" varchar PRIMARY KEY,
  "Region" varchar
);

CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "Tracks" int,
  "CityName" varchar UNIQUE,
  "CityRegion" varchar
);

CREATE TABLE "Train" (
  "TrainNr" int PRIMARY KEY,
  "StartStationName" varchar,
  "EndStationName" varchar,
  "Length" int
);

CREATE TABLE "Connected" (
  "Departure" date,
  "Arrival" date,
  "TrainNr" int UNIQUE,
  "StartStationName" varchar UNIQUE,
  "EndStationName" varchar UNIQUE
);

ALTER TABLE "Station" ADD FOREIGN KEY ("CityName") REFERENCES "City" ("Name");

ALTER TABLE "Connected" ADD FOREIGN KEY ("StartStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Connected" ADD FOREIGN KEY ("EndStationName") REFERENCES "Station" ("Name");

ALTER TABLE "Connected" ADD FOREIGN KEY ("TrainNr") REFERENCES "Train" ("TrainNr");