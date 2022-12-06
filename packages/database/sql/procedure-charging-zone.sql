DROP PROCEDURE IF EXISTS show_charging_zone_all;
DROP PROCEDURE IF EXISTS charging_zone_add;
DROP PROCEDURE IF EXISTS show_charging_zone_city;
DROP PROCEDURE IF EXISTS delete_charging_zone;
DROP PROCEDURE IF EXISTS update_charging_zone;
DROP PROCEDURE IF EXISTS show_charging_zone_id;

DELIMITER ;;

-- Get all charging zones
-- GET /chargingzones
CREATE PROCEDURE show_charging_zone_all()
    READS SQL DATA
BEGIN
    SELECT  id,
            parking_zone_id,
            ST_AsGeoJSON(area) AS area
    FROM charging_zone;
END
;;

-- Create new charging zone
-- POST /chargingzones
CREATE PROCEDURE charging_zone_add(
    p_id INT,
    z_area TEXT
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO charging_zone (parking_zone_id, area)
    VALUES (p_id, ST_GeomFromGeoJSON(z_area));
END
;;

-- Get charging zones in city
-- GET chargingzones/city/:cityName
CREATE PROCEDURE show_charging_zone_city(
    c_name VARCHAR(45)
)
    READS SQL DATA
BEGIN
    SELECT
        id,
        parking_zone_id,
        ST_AsGeoJSON(area) as area
    FROM charging_zone 
    WHERE parking_zone_id IN
        (SELECT id from parking_zone 
        WHERE city_id = 
            (SELECT id 
            FROM city 
            WHERE name = c_name));
END
;;


-- Delete charging zone
-- DELETE chargingzones/:chargingZoneId
CREATE PROCEDURE delete_charging_zone(
    z_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM charging_zone WHERE id = z_id;
END
;;



-- Update charging zone
-- PUT chargingzones/:chargingZoneId
CREATE PROCEDURE update_charging_zone(
    z_id INT,
    parking_z_id INT,
    z_area TEXT
)
BEGIN
    UPDATE charging_zone
    SET parking_zone_id = parking_z_id,
        area            = ST_GeomFromGeoJSON(z_area)
    WHERE id = z_id;
END
;;


-- Get specific charging zone
-- GET chargingzones/:chargingZoneId
CREATE PROCEDURE show_charging_zone_id(
    z_id INT
)
    READS SQL DATA
BEGIN
    SELECT
        id,
        parking_zone_id,
        ST_AsGeoJSON(area) as area
    FROM charging_zone WHERE id = z_id;
END
;;

DELIMITER ;
