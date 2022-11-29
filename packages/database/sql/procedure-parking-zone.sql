-- Get all parking zones
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

-- Get all parking zones in city
DROP PROCEDURE IF EXISTS show_parking_zone_city;

DELIMITER ;;
CREATE PROCEDURE show_parking_zone_city(
    c_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            city_id,
            ST_AsGeoJSON(area) as area
    FROM parking_zone WHERE city_id = c_id;
END
;;

DELIMITER ;

-- Delete specific parkingzone
-- Get spcific parkingzone
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
