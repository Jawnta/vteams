
-- Get all invoicess
DROP PROCEDURE IF EXISTS show_invoice_all;

DELIMITER ;;
CREATE PROCEDURE show_invoice_all()
    READS SQL DATA
BEGIN
    SELECT *
    FROM invoice;
END
;;

DELIMITER ;
-- Create new invoice
-- Delete invoice
-- Update invoice

-- Get specific invoice
DROP PROCEDURE IF EXISTS show_invoice_id;
DELIMITER ;;
CREATE PROCEDURE show_invoice_id(
    i_id INT
)
    READS SQL DATA
BEGIN
    SELECT *
    FROM invoice WHERE id = i_id;
END
;;

DELIMITER ;

-- Get invoices for user
DROP PROCEDURE IF EXISTS show_invoice_user;
DELIMITER ;;
CREATE PROCEDURE show_invoice_user(
    u_id INT
)
    READS SQL DATA
BEGIN
    SELECT *
    FROM invoice WHERE trip_id IN
        (SELECT user_id
        FROM trip 
        WHERE user_id = u_id);
END
;;

DELIMITER ;

