-- insert maintinace_log -> last_served (scooter)
    -- invoked_by service

-- scooter_log insert -> charge, position, distance_traveled? (scooter)
    -- Update scooter(id) charge = charge
    -- last position = position
    -- scooter_distance =+ speed * intervalltid för log skick ?

-- Trip stop_time -> distance?, avalible (scooter), create (invoice)
    -- (stop_time - start_time) * 3(kr/min) + 10? (Lime: Startpris 10 kr + 3 kr/min) - users credit = amount
    -- status = fakturerad?
    -- id = trip_id
    -- procedure invoice_add

-- charging_station -> is_charging (scooter)

-- Rensa scooter_log