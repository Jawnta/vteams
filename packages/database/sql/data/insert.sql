use vteams;

DELETE FROM charging_station;
DELETE FROM charging_zone;
DELETE FROM parking_zone;
DELETE FROM trip;
DELETE FROM scooter;
DELETE FROM user;
DELETE FROM city;


SOURCE insert_city.sql;
SOURCE insert_users.sql;
SOURCE insert_scooters.sql;
SOURCE insert_parking.sql;
SOURCE insert_charging_zone.sql;
SOURCE insert_charging_station.sql;
SOURCE insert_trips.sql;
SOURCE update_trips.sql;


