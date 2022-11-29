
-- Get all users
-- GET /users
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
-- POST /users

-- Delete user
-- DELETE /users/:userId

-- Get specific user
-- GET /users/:userId
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
-- PUT /users/:userId

