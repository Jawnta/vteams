DROP PROCEDURE IF EXISTS show_trip_all;
DROP PROCEDURE IF EXISTS trip_add;
DROP PROCEDURE IF EXISTS show_trip_id;
DROP PROCEDURE IF EXISTS update_trip;
DROP PROCEDURE IF EXISTS delete_trip;
DROP PROCEDURE IF EXISTS show_trip_user;
DROP PROCEDURE IF EXISTS trip_stop;


DELIMITER ;;

-- Get all trips
-- GET /trips
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

-- Create a new trip
-- POST /trips
CREATE PROCEDURE trip_add(
    u_id INT,
    s_id INT,
    t_start_position TEXT
)
BEGIN
    INSERT INTO trip (user_id, scooter_id, start_position)
    VALUES (u_id, s_id, ST_GeomFromGeoJSON(t_start_position));
END
;;


-- Get specific trip
-- GET /trips/:tripId
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


-- Update specific trip
-- PUT /trips/:tripId
CREATE PROCEDURE update_trip(
    t_id INT,
    u_id INT,
    s_id INT,
    t_distance FLOAT,
    t_completed TINYINT(1),
    t_start_position TEXT,
    t_stop_position TEXT,
    t_start_time TIMESTAMP,
    t_stop_time TIMESTAMP
)
BEGIN
    UPDATE trip
    SET user_id        = u_id,
        scooter_id     = s_id,
        distance       = t_distance,
        completed      = t_completed,
        start_position = ST_GeomFromGeoJSON(t_start_position),
        stop_position  = ST_GeomFromGeoJSON(t_stop_position),
        start_time     = t_start_time,
        stop_time      = t_stop_time
    WHERE id = t_id;
END
;;


-- Delete trip
-- DELETE /trips/:tripId
CREATE PROCEDURE delete_trip(
    t_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM trip WHERE id = t_id;
END
;;


-- Get trips for user
-- GET /users/:userId/trips
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
            IF(stop_time,date_format(stop_time, '%Y-%m-%d %H:%i:%s'),NULL) as stop_time
    FROM trip WHERE user_id = u_id;
END
;;

-- stop_trip? (id, stop_position)
CREATE PROCEDURE trip_stop(
    t_id INT,
    stop_position TEXT
)
BEGIN
    UPDATE trip
    SET stop_position  = ST_GeomFromGeoJSON(t_stop_position),
        stop_time      = CURRENT_TIMESTAMP()
    WHERE id = t_id;
END
;;

DELIMITER ;