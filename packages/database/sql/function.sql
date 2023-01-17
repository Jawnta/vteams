DELIMITER ;;

CREATE FUNCTION in_parking_zone(IN position GEOMETRY, IN city VARCHAR(20)) RETURNS INT
BEGIN
    SET inside = (SELECT ST_WITHIN(position, area) FROM parking_zone WHERE city_id = city);
--   if (c > 99) then
--     return  3;
--   else
--     return res;
--   end if;
    return SUM(inside)
END;
;;

CREATE FUNCTION get_amount(IN position point, IN city VARCHAR(20)) RETURNS INT
BEGIN
  SET inside = add_func3(a, b, c) + d;
  if (c > 99) then
    return  3;
  else
    return res;
  end if;
END;
;;

DELIMITER ;