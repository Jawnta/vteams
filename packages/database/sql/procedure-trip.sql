
-- Get all trips
-- GET /trips
DROP PROCEDURE IF EXISTS show_trip_all;

DELIMITER ;;
CREATE PROCEDURE show_trip_all()
    READS SQL DATA
BEGIN
    SELECT  id,
            user_id,
            scooter_id,
            distance,
            completed,
            ST_AsGeoJSON(start_position) as start_position,
            ST_AsGeoJSON(stop_position) as stop_position,
            DATE_FORMAT(start_time, '%Y-%m-%d %H:%i:%s') as start_time,
            DATE_FORMAT(stop_time, '%Y-%m-%d %H:%i:%s') as stop_time
    FROM trip;
END
;;

DELIMITER ;
-- Create a new trip
-- POST /trips
DROP PROCEDURE IF EXISTS trip_add;

DELIMITER ;;
CREATE PROCEDURE trip_add(
    u_id INT,
    s_id INT,
    t_start_position VARCHAR(100)
)
BEGIN
    INSERT INTO trip (user_id, scooter_id, start_position)
    VALUES (u_id, s_id, ST_GeomFromGeoJSON(t_start_position));
END
;;

DELIMITER ;

-- Get specific trip
-- GET /trips/:tripId
DROP PROCEDURE IF EXISTS show_trip_id;

DELIMITER ;;
CREATE PROCEDURE show_trip_id(
    t_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            user_id,
            scooter_id,
            distance,
            completed,
            ST_AsGeoJSON(start_position) as start_position,
            ST_AsGeoJSON(stop_position) as stop_position,
            DATE_FORMAT(start_time, '%Y-%m-%d %H:%i:%s') as start_time,
            DATE_FORMAT(stop_time, '%Y-%m-%d %H:%i:%s') as stop_time
    FROM trip WHERE id = t_id;
END
;;

DELIMITER ;

-- Update specific trip
-- PUT /trips/:tripId
DROP PROCEDURE IF EXISTS update_trip;

DELIMITER ;;
CREATE PROCEDURE update_trip(
    t_id INT,
    u_id INT,
    s_id INT,
    t_distance FLOAT,
    t_completed TINYINT(1),
    t_start_position VARCHAR(100),
    t_stop_position VARCHAR(100),
    t_start_time DATETIME,
    t_stop_time DATETIME
)
BEGIN
    UPDATE trip
    SET user_id        = u_id,
        scooter_id     = s_id,
        distance       = t_distance,
        completed      = t_completed,
        start_position = ST_GeomFromGeoJSON(t_start_position),
        stop_position  = ST_GeomFromGeoJSON(t_start_position),
        start_time     = t_start_time,
        stop_time      = t_stop_time
    WHERE id = t_id;
END
;;

DELIMITER ;

-- Delete trip
-- DELETE /trips/:tripId
DROP PROCEDURE IF EXISTS delete_trip;

DELIMITER ;;
CREATE PROCEDURE delete_trip(
    t_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM trip WHERE id = t_id;
END
;;

DELIMITER ;


-- Get trips for user
-- GET /users/:userId/trips
DROP PROCEDURE IF EXISTS show_trip_user;

DELIMITER ;;
CREATE PROCEDURE show_trip_user(
    u_id INT
)
    READS SQL DATA
BEGIN
    SELECT  id,
            user_id,
            scooter_id,
            distance,
            completed,
            ST_AsGeoJSON(start_position) as start_position,
            ST_AsGeoJSON(stop_position) as stop_position,
            DATE_FORMAT(start_time, '%Y-%m-%d %H:%i:%s') as start_time,
            DATE_FORMAT(stop_time, '%Y-%m-%d %H:%i:%s') as stop_time
    FROM trip WHERE user_id = u_id;
END
;;

DELIMITER ;