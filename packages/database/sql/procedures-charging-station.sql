
-- Get all charging stations
-- GET /chargingstations
DROP PROCEDURE IF EXISTS show_charging_station_all;

DELIMITER ;;
CREATE PROCEDURE show_charging_station_all()
    READS SQL DATA
BEGIN
    SELECT  id,
            charging_zone,
            ST_AsGeoJSON(position) as position,
            occupied,
            scooter_id
    FROM charging_station;
END
;;

DELIMITER ;

-- Create new charging station
-- POST /chargingstations

-- Get charging stations in charging zone
-- GET chargingstations/zone/:chargingZoneId
DROP PROCEDURE IF EXISTS show_charging_station_zone;
DELIMITER ;;
CREATE PROCEDURE show_charging_station_zone(
    z_id INT
)
BEGIN
    SELECT
        id,
        charging_zone,
        ST_AsGeoJSON(position) as position,
        occupied,
        scooter_id
    FROM charging_station WHERE charging_zone = z_id;
END
;;

DELIMITER ;

-- Update specific charging station
-- PUT chargingstations/:chargingStationId

-- Delete charging station
-- DELETE chargingstations/:chargingStationId
DROP PROCEDURE IF EXISTS delete_charging_station;

DELIMITER ;;
CREATE PROCEDURE delete_charging_station(
    s_id INT
)
BEGIN
    DELETE FROM charging_station WHERE id = s_id;
END
;;

DELIMITER ;

-- Get charging station by id
-- GET chargingstations/:chargingStationId
DROP PROCEDURE IF EXISTS show_charging_station_id;
DELIMITER ;;
CREATE PROCEDURE show_charging_station_id(
    s_id INT
)
BEGIN
    SELECT
        id,
        charging_zone,
        ST_AsGeoJSON(position) as position,
        occupied,
        scooter_id
    FROM charging_station WHERE id = s_id;
END
;;

DELIMITER ;


