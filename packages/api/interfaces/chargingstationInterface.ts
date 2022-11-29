import { CoordinatesInterface } from "./coordinatesInterface";

export interface ChargingStationInterface {
  id: number;
  charging_zone_id: number;
  position: CoordinatesInterface;
  occupied: boolean;
  scooter_id?: number;
}
