-- Get all scooters
DROP PROCEDURE IF EXISTS show_scooter_all;

DELIMITER ;;
CREATE PROCEDURE show_scooter_all()
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter;
END
;;

DELIMITER ;
-- Create new scooter

-- Get all available scooters
DROP PROCEDURE IF EXISTS show_scooter_available;
DELIMITER ;;
CREATE PROCEDURE show_scooter_available()
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter WHERE available = 1;
    -- Or available = true?
END
;;

DELIMITER ;

-- Get all scooters in city
DROP PROCEDURE IF EXISTS show_scooter_city;
DELIMITER ;;
CREATE PROCEDURE show_scooter_city(
    c_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter WHERE city_id = c_id;
    -- Or available = true?
END
;;

-- Delete specific scooter

-- Get specific scooter
DROP PROCEDURE IF EXISTS show_scooter_id;
DELIMITER ;;
CREATE PROCEDURE show_scooter_id(
    s_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            available,
            enabled,
            charge,
            DATE_FORMAT(last_serviced, '%Y-%m-%d %H:%i:%s') as last_serviced,
            DATE_FORMAT(first_used, '%Y-%m-%d %H:%i:%s') as first_used,
            distance_traveled,
            ST_AsGeoJSON(last_position) as last_position,
            is_charging,
            city_id
    FROM scooter WHERE id = s_id;
    -- Or available = true?
END
;;

-- Update scooter
-- Get scooter logs
-- Add scooter log???
-- Get scooters in parking zone??
