CREATE TABLE "StationPersonell" (
  "PersNr" int PRIMARY KEY,
  "Name" int,
  "StatNr" int UNIQUE
);

CREATE TABLE "BigStation" (
  "StatNr" int PRIMARY KEY,
  "Name" varchar
);

CREATE TABLE "Room" (
  "RoomNr" int PRIMARY KEY,
  "Beds" int,
  "StatNr" int UNIQUE
);

CREATE TABLE "Patient" (
  "PatientNr" int PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar,
  "RoomNr" int UNIQUE,
  "AdmissionFrom" varchar,
  "AdmissionTo" varchar,
  "DoctorNr" int UNIQUE
);

CREATE TABLE "Caregiver" (
  "CaregiverNr" int PRIMARY KEY,
  "Qualification" varchar
);

CREATE TABLE "Doctor" (
  "DoctorNr" int PRIMARY KEY,
  "Area" varchar,
  "Rank_" int
);

ALTER TABLE "Caregiver" ADD FOREIGN KEY ("CaregiverNr") REFERENCES "StationPersonell" ("PersNr");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("DoctorNr") REFERENCES "StationPersonell" ("PersNr");

ALTER TABLE "StationPersonell" ADD FOREIGN KEY ("StatNr") REFERENCES "BigStation" ("StatNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("StatNr") REFERENCES "BigStation" ("StatNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("RoomNr") REFERENCES "Room" ("RoomNr");

ALTER TABLE "Patient" ADD FOREIGN KEY ("DoctorNr") REFERENCES "StationPersonell" ("PersNr");
