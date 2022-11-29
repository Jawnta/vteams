
-- Get all charging zones
-- GET /chargingzones
DROP PROCEDURE IF EXISTS show_charging_zone_all;

DELIMITER ;;
CREATE PROCEDURE show_charging_zone_all()
    READS SQL DATA
BEGIN
    SELECT  id,
            parking_zone_id,
            ST_AsGeoJSON(area) as area,
    FROM charging_zone;
END
;;

DELIMITER ;

-- Create new charging zone
-- POST /chargingzones


-- Get charging zones in city
-- GET chargingzones/city/:cityName
DROP PROCEDURE IF EXISTS show_charging_zone_city;
DELIMITER ;;
CREATE PROCEDURE show_charging_zone_city(
    c_name VARCHAR(20)
)
    READS SQL DATA
BEGIN
    SELECT
        id,
        parking_zone_id,
        ST_AsGeoJSON(area) as area,
    FROM charging_zone 
    WHERE parking_zone_id IN
        (SELECT id from parking_zone 
        WHERE city_id = 
            (SELECT id 
            FROM city 
            WHERE name = c_name););
END
;;

DELIMITER ;

-- Delete charging zone
-- DELETE chargingzones/:chargingZoneId
DROP PROCEDURE IF EXISTS delete_charging_zone;

DELIMITER ;;
CREATE PROCEDURE delete_charging_zone(
    z_id INT
)
BEGIN
    DELETE FROM charging_zone WHERE id = z_id;
END
;;

DELIMITER ;


-- Update charging zone
-- PUT chargingzones/:chargingZoneId


-- Get specific charging zone
-- GET chargingzones/:chargingZoneId
DROP PROCEDURE IF EXISTS show_charging_zone_id;
DELIMITER ;;
CREATE PROCEDURE show_charging_zone_id(
    z_id INT
)
    READS SQL DATA
BEGIN
    SELECT
        id,
        parking_zone_id,
        ST_AsGeoJSON(area) as area,
    FROM charging_zone WHERE id = z_id;
END
;;

DELIMITER ;
