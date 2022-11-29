
-- Get all users
DROP PROCEDURE IF EXISTS show_user_all;

DELIMITER ;;
CREATE PROCEDURE show_user_all()
    READS SQL DATA
BEGIN
    SELECT  *
    FROM user;
END
;;

DELIMITER ;
-- Create new user

-- Delete user

-- Get specific user
DROP PROCEDURE IF EXISTS show_user_id;

DELIMITER ;;
CREATE PROCEDURE show_user_id(
    u_id INT
)
    READS SQL DATA
BEGIN
    SELECT  *
    FROM user
    WHERE id = u_id;
END
;;

DELIMITER ;
-- Update user data

