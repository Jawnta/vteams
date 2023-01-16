DROP PROCEDURE IF EXISTS show_charging_station_all;
DROP PROCEDURE IF EXISTS charging_station_add;
DROP PROCEDURE IF EXISTS show_charging_station_zone;
DROP PROCEDURE IF EXISTS update_charging_station;
DROP PROCEDURE IF EXISTS delete_charging_station;
DROP PROCEDURE IF EXISTS show_charging_station_id;
DELIMITER ;;

-- Get all charging stations
-- GET /chargingstations
CREATE PROCEDURE show_charging_station_all() READS SQL DATA BEGIN
SELECT id,
    charging_zone_id,
    ST_AsGeoJSON(position) as position,
    occupied,
    scooter_id
FROM charging_station;
END
;;

-- Create new charging station
-- POST /chargingstations
CREATE PROCEDURE charging_station_add(
    z_id VARCHAR(20),
    z_position TEXT,
    z_occupied TINYINT(1)
) MODIFIES SQL DATA BEGIN
INSERT INTO charging_station (charging_zone_id, position, occupied)
VALUES (z_id, ST_GeomFromGeoJSON(z_position), z_occupied);
END
;;

-- Get charging stations in charging zone
-- GET chargingstations/zone/:chargingZoneId
CREATE PROCEDURE show_charging_station_zone(z_id VARCHAR(20)) BEGIN
SELECT id,
    charging_zone_id,
    ST_AsGeoJSON(position) as position,
    occupied,
    scooter_id
FROM charging_station
WHERE charging_zone_id = z_id;
END
;;

-- Update specific charging station
-- PUT chargingstations/:chargingStationId
CREATE PROCEDURE update_charging_station(
    s_id INT,
    z_id VARCHAR(20),
    s_position TEXT,
    s_occupied TINYINT(1)
) BEGIN
UPDATE charging_station
SET charging_zone_id = z_id,
    position = ST_GeomFromGeoJSON(s_position),
    occupied = s_occupied
WHERE id = s_id;
END
;;

-- Delete charging station
-- DELETE chargingstations/:chargingStationId
CREATE PROCEDURE delete_charging_station(s_id INT) MODIFIES SQL DATA BEGIN
DELETE FROM charging_station
WHERE id = s_id;
END
;;

-- Get charging station by id
-- GET chargingstations/:chargingStationId
CREATE PROCEDURE show_charging_station_id(s_id INT) BEGIN
SELECT id,
    charging_zone_id,
    ST_AsGeoJSON(position) as position,
    occupied,
    scooter_id
FROM charging_station
WHERE id = s_id;
END
;;



DELIMITER ;