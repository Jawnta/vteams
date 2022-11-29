
-- Get all cities
DROP PROCEDURE IF EXISTS show_city_all;

DELIMITER ;;
CREATE PROCEDURE show_city_all()
    READS SQL DATA
BEGIN
    SELECT  *
    FROM city;
END
;;

DELIMITER ;