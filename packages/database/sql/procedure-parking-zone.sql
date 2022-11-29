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
