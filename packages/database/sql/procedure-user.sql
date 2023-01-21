DROP PROCEDURE IF EXISTS show_user_all;
DROP PROCEDURE IF EXISTS user_add;
DROP PROCEDURE IF EXISTS delete_user;
DROP PROCEDURE IF EXISTS show_user_id;
DROP PROCEDURE IF EXISTS update_user;
DROP PROCEDURE IF EXISTS show_user_token;

DELIMITER ;;

-- Get all users
-- GET /users
CREATE PROCEDURE show_user_all() READS SQL DATA BEGIN
SELECT *
FROM user;
END
;;

-- Create new user
-- POST /users

CREATE PROCEDURE user_add(

    u_first_name VARCHAR(45),
    u_last_name VARCHAR(45),
    u_phone_nr INT,
    u_email VARCHAR(45),
    u_social_security VARCHAR(45),
    u_token VARCHAR(45)
) BEGIN
INSERT INTO user (
        first_name,
        last_name,
        phone_number,
        email,
        social_security,
        token
    )
VALUES (
        u_first_name,
        u_last_name,
        u_phone_nr,
        u_email,
        u_social_security,
        u_token
    );
END
;;

-- Delete user
-- DELETE /users/:userId

CREATE PROCEDURE delete_user(
    u_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM user WHERE id = u_id;
END
;;


-- Get specific user
-- GET /users/:userId
CREATE PROCEDURE show_user_id(u_id INT) READS SQL DATA BEGIN
SELECT *
FROM user
WHERE id = u_id;
END
;;

-- Get specific user
-- GET /users/:userId
CREATE PROCEDURE add_credit(u_id INT, credit_add INT)
BEGIN
START TRANSACTION;
    SELECT @trip:=id FROM trip WHERE user_id=u_id;
    SELECT id, amount INTO @i_id,@amount FROM invoice WHERE trip_id = @trip;
    UPDATE user 
    SET 
        credit = credit + credit_add,
        enabled = IF(credit_add > @amount, 1, 0)
    WHERE id = u_id;
    IF credit_add > @amount THEN
        UPDATE invoice
        SET payed = CURRENT_TIMESTAMP()
        WHERE id = @i_id;
    END IF;
    COMMIT;
END
;;

-- Get specific user
-- GET /users/:token
CREATE PROCEDURE show_user_token(u_token VARCHAR(45)) READS SQL DATA 
BEGIN
SELECT *
FROM user
WHERE token = u_token;
END
;;

-- Update user data
-- PUT /users/:userId
CREATE PROCEDURE update_user(
    u_id INT,
    u_first_name VARCHAR(45),
    u_last_name VARCHAR(45),
    u_phone_nr INT,
    u_email VARCHAR(45),
    u_social_security VARCHAR(45),
    u_enabled TINYINT(1),
    u_credit FLOAT,
    u_token VARCHAR(45)
) BEGIN
UPDATE user
SET first_name = u_first_name,
    last_name = u_last_name,
    phone_number = u_phone_nr,
    email = u_email,
    social_security = u_social_security,
    enabled = u_enabled,
    credit = u_credit,
    token = u_token
WHERE id = u_id;
END
;;

-- Procedure add credit

DELIMITER ;