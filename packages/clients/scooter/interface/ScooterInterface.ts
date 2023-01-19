import {CoordinatesInterface} from "./CoordinatesInterface";

export default interface ScooterInterface {
    id: number;
    available: boolean;
    enabled: boolean;
    charge: number;
    last_serviced: Date;
    first_used: Date;
    distance_traveled: number;
    last_position: CoordinatesInterface;
    is_charging: boolean;
    city_id: string;
}
