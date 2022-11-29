
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

-- GET chargingstations/:chargingStationId


