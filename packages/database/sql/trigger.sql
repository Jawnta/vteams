-- charging_station -> is_charging (scooter)
-- Rensa scooter_log
-- scooter_log insert -> charge, position, distance_traveled? (scooter)
-- Update scooter(id) charge = charge
-- last position = position
-- scooter_distance =+ speed * intervalltid för log skick ?
DROP TRIGGER IF EXISTS scooter_log_update_scooter();
CREATE TRIGGER scooter_log_update_scooter()
AFTER
INSERT ON scooter_log FOR EACH ROW
UPDATE scooter
SET charge = NEW.charge,
    last_position = NEW.position,
    distance_traveled = (NEW.speed * 0.01666666666) -- insert maintinace_log -> last_served (scooter)
    -- invoked_by service
    DROP TRIGGER IF EXISTS maintenance_log_update_scooter();
CREATE TRIGGER maintenance_log_update_scooter()
AFTER
INSERT ON scooter_log FOR EACH ROW
INSERT INTO logg (`handelse`)
VALUES (
        CONCAT(
            'Ny produkt lades till med produktid: ',
            NEW.kod,
            '.'
        )
    );
-- Trip stop_time -> distance?, avalible (scooter), create (invoice)
-- (stop_time - start_time) * 3(kr/min) + 10? (Lime: Startpris 10 kr + 3 kr/min) - users credit = amount
-- status = fakturerad?
DROP TRIGGER IF EXISTS stop_trip_create_invoice();
CREATE TRIGGER stop_trip_create_invoice()
AFTER
INSERT ON scooter_log FOR EACH ROW
INSERT INTO logg (`handelse`)
VALUES (
        CONCAT(
            'Ny produkt lades till med produktid: ',
            NEW.kod,
            '.'
        )
    );