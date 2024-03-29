
DROP PROCEDURE IF EXISTS show_parking_zone_all;
DROP PROCEDURE IF EXISTS parking_zone_add;
DROP PROCEDURE IF EXISTS show_parking_zone_city;
DROP PROCEDURE IF EXISTS delete_parking_zone;
DROP PROCEDURE IF EXISTS show_parking_zone_id;
DROP PROCEDURE IF EXISTS update_parking_zone;

DELIMITER ;;

-- Get all parking zones
-- GET /parkingzones
CREATE PROCEDURE show_parking_zone_all()
    READS SQL DATA
BEGIN
    SELECT 
        id,
        city_id,
        ST_AsGeoJSON(area) AS area
    FROM parking_zone;
END
;;

-- Create new parkingzone
-- POST /parkingzones
CREATE PROCEDURE parking_zone_add(
    c_id VARCHAR(20),
    z_area TEXT
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO parking_zone (city_id, area)
    VALUES (c_id, ST_GeomFromGeoJSON(z_area));
END
;;

-- Get all parking zones in city
-- GET parkingzones/city/:cityName
CREATE PROCEDURE show_parking_zone_city(
    c_name VARCHAR(45)
)
    READS SQL DATA
BEGIN
    SELECT  id,
            city_id,
            ST_AsGeoJSON(area) as area
    FROM parking_zone WHERE city_id = 
        (SELECT id
        FROM city
        WHERE name = c_name);
END
;;

-- Delete specific parkingzone
-- DELETE /parkingzones/:parkingZoneId
CREATE PROCEDURE delete_parking_zone(
    z_id VARCHAR(20)
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM parking_zone WHERE id = z_id;
END
;;

-- Get spcific parkingzone
-- GET /parkingzones/:parkingZoneId
CREATE PROCEDURE show_parking_zone_id(
    p_id VARCHAR(20)
)
    READS SQL DATA
BEGIN
    SELECT  id,
            city_id,
            ST_AsGeoJSON(area) as area
    FROM parking_zone WHERE id = p_id;
END
;;

-- Update parking zone
-- PUT /parkingzones/:parkingZoneId
CREATE PROCEDURE update_parking_zone(
    z_id VARCHAR(20),
    c_id VARCHAR(20),
    z_area TEXT
)
BEGIN
    UPDATE parking_zone
    SET city_id       = c_id,
        area          = ST_GeomFromGeoJSON(z_area)
    WHERE id = z_id;
END
;;

DELIMITER ;
