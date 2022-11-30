-- Get all invoicess
-- GET /invoices
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
-- POST /invoices

DROP PROCEDURE IF EXISTS invoice_add;

DELIMITER ;;
CREATE PROCEDURE invoice_add(
    t_id INT,
    i_status VARCHAR(45),
    i_amount FLOAT
)
    MODIFIES SQL DATA
BEGIN
    INSERT INTO invoice (trip_id, status, amount)
    VALUES (t_id, i_status, i_amount);
END
;;

DELIMITER ;


-- Delete invoice
-- DELETE invoices/:invoiceId
DROP PROCEDURE IF EXISTS delete_invoice;

DELIMITER ;;
CREATE PROCEDURE delete_invoice(
    i_id INT
)
    MODIFIES SQL DATA
BEGIN
    DELETE FROM invoice WHERE id = i_id;
END
;;

DELIMITER ;

-- Update invoice
-- PUT invoices/:invoiceId
DROP PROCEDURE IF EXISTS update_invoice;

DELIMITER ;;
CREATE PROCEDURE update_invoice(
    i_id INT,
    t_id INT,
    i_status VARCHAR(45),
    i_amount FLOAT
)
BEGIN
    UPDATE invoice
    SET trip_id      = t_id,
        status       = i_status,
        amount       = i_amount
    WHERE id = i_id;
END
;;

DELIMITER ;

-- Get specific invoice
-- GET invoices/:invoiceId
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
-- GET /users/:userId/invoices

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

