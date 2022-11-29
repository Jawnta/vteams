import { GeometryInterface } from "./geometryInterface";

export interface ChargingZoneInterface {
    id: number,
    parking_zone_id: number,
    area: GeometryInterface
}