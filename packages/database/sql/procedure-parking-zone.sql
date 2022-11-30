-- Get all parking zones
-- GET /parkingzones
DROP PROCEDURE IF EXISTS show_parking_zone_all;

DELIMITER ;;
CREATE PROCEDURE show_parking_zone_all()
    READS SQL DATA
BEGIN
    SELECT  id,
            city_id,
            ST_AsGeoJSON(area) as area
    FROM parking_zone;
END
;;

DELIMITER ;

-- Create new parkingzone
-- POST /parkingzones

DROP PROCEDURE IF EXISTS parking_zone_add;

DELIMITER ;;
CREATE PROCEDURE parking_zone_add(
    c_id INT,
    z_area VARCHAR(100)
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO parking_zone (city_id, area)
    VALUES (c_id, ST_GeomFromGeoJSON(z_area))
END
;;

DELIMITER ;

-- Get all parking zones in city
-- GET parkingzones/city/:cityName
DROP PROCEDURE IF EXISTS show_parking_zone_city;

DELIMITER ;;
CREATE PROCEDURE show_parking_zone_city(
    c_name INT
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

DELIMITER ;

-- Delete specific parkingzone
-- DELETE /parkingzones/:parkingZoneId
DROP PROCEDURE IF EXISTS delete_parking_zone;

DELIMITER ;;
CREATE PROCEDURE delete_parking_zone(
    z_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM parking_zone WHERE id = z_id;
END
;;

DELIMITER ;

-- Get spcific parkingzone
-- GET /parkingzones/:parkingZoneId
DROP PROCEDURE IF EXISTS show_parking_zone_id;

DELIMITER ;;
CREATE PROCEDURE show_parking_zone_id(
    p_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            city_id,
            ST_AsGeoJSON(area) as area
    FROM parking_zone WHERE id = p_id;
END
;;

DELIMITER ;

-- Update parking zone
-- PUT /parkingzones/:parkingZoneId
DROP PROCEDURE IF EXISTS update_parking_zone;

DELIMITER ;;
CREATE PROCEDURE update_parking_zone(
    z_id INT,
    c_id INT,
    z_area VARCHAR(100),
)
BEGIN
    UPDATE parking_zone
    SET city_id       = c_id,
        area          = ST_GeomFromGeoJSON(z_area)
    WHERE id = z_id;
END
;;

DELIMITER ;
