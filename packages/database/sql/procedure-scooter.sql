DROP PROCEDURE IF EXISTS show_scooter_all;
DROP PROCEDURE IF EXISTS scooter_add;
DROP PROCEDURE IF EXISTS show_scooter_available;
DROP PROCEDURE IF EXISTS show_scooter_city;
DROP PROCEDURE IF EXISTS delete_scooter;
DROP PROCEDURE IF EXISTS show_scooter_id;
DROP PROCEDURE IF EXISTS update_scooter;
DROP PROCEDURE IF EXISTS show_scooter_logs;
DROP PROCEDURE IF EXISTS scooter_log_add;
DROP PROCEDURE IF EXISTS disable_scooter;
DROP PROCEDURE IF EXISTS enable_scooter;
DROP PROCEDURE IF EXISTS show_scooter_logs_maintenance;
DROP PROCEDURE IF EXISTS scooter_log_maintenance_add;


DELIMITER ;;

-- Get all scooters
-- GET /scooters
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

-- Create new scooter
-- POST /scooters
CREATE PROCEDURE scooter_add(
    s_available TINYINT(1),
    s_enabled TINYINT(1),
    s_charge FLOAT,
    s_last_position TEXT,
    s_is_charging TINYINT(1),
    c_id INT
)
BEGIN
    INSERT INTO scooter (available, enabled, charge, last_position, is_charging, city_id)
    VALUES (s_available, s_enabled, s_charge, ST_GeomFromGeoJSON(s_last_position), s_is_charging, c_id);
END
;;

-- Get all available scooters
-- GET scooters/available
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
END
;;


-- Get all scooters in city
-- GET /scooters/city/:cityName
CREATE PROCEDURE show_scooter_city(
    c_name VARCHAR(45)
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
    FROM scooter WHERE city_id = 
        (SELECT id FROM city
        WHERE name = c_name);
END
;;

-- Delete specific scooter
-- DELETE scooters/:scooterId
CREATE PROCEDURE delete_scooter(
    s_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM scooter WHERE id = s_id;
END
;;


-- Get specific scooter
-- GET scooters/:scooterId
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
-- PUT scooters/:scooterId
CREATE PROCEDURE update_scooter(
    s_id INT,
    s_available TINYINT(1),
    s_enabled TINYINT(1),
    s_charge FLOAT,
    s_last_serviced DATETIME,
    s_first_used DATETIME,
    s_distance_traveled FLOAT,
    s_last_position TEXT,
    s_is_charging TINYINT(1),
    c_id INT
)
BEGIN
    UPDATE scooter
    SET available         = s_available,
        enabled           = s_enabled,
        charge            = s_charge,
        last_serviced     = s_last_serviced,
        first_used        = s_first_used,
        distance_traveled = s_distance_traveled,
        last_position     = ST_GeomFromGeoJSON(s_last_position),
        is_charging       = s_is_charging,
        city_id           = c_id
    WHERE id = s_id;
END
;;


-- Get scooter logs
-- GET /scooters/:scooterId/logs
CREATE PROCEDURE show_scooter_logs(
    s_id INT
)
    READS SQL DATA
BEGIN
    SELECT  * FROM scooter_log 
    WHERE scooter_id = s_id
    ORDER BY 'timestamp' DESC;
END
;;

-- POST /scooters/:scooterId/log???
CREATE PROCEDURE scooter_log_add(
    s_id INT,
    s_speed INT,
    s_position TEXT,
    s_status VARCHAR(20),
    s_charge INT
)
BEGIN
    INSERT INTO scooter_log (scooter_id, speed, position, status, charge)
    VALUES (s_id, s_speed, ST_GeomFromGeoJSON(s_position), s_status, s_charge);
END
;;

-- disable scooter?
CREATE PROCEDURE disable_scooter(
    s_id INT
)
BEGIN
    UPDATE scooter
    SET enabled = 0
    WHERE id = s_id;
END
;;

-- enable scooter?
CREATE PROCEDURE enable_scooter(
    s_id INT
)
BEGIN
    UPDATE scooter
    SET enabled = 1
    WHERE id = s_id;
END
;;

-- Get scooter maintenance_log?
CREATE PROCEDURE show_scooter_logs_maintenance(
    s_id INT
)
    READS SQL DATA
BEGIN
    SELECT  * FROM maintenance_log 
    WHERE scooter_id = s_id
    ORDER BY 'timestamp' DESC;
END
;;

-- POST /scooters/:scooterId/log???
CREATE PROCEDURE scooter_log_maintenance_add(
    s_id INT,
    l_event VARCHAR(100),
    l_invoked_by VARCHAR(20)
)
BEGIN
    INSERT INTO maintenance_log (scooter_id, event, invoked_by)
    VALUES (s_id, l_event, l_invoked_by);
END
;;

DELIMITER ;
