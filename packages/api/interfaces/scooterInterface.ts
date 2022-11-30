import {CoordinatesInterface} from './coordinatesInterface';

export interface ScooterInterface {
    id: number;
    available: boolean;
    enabled: boolean;
    charge: number;
    last_serviced: Date;
    first_used: Date;
    distance_traveled: number;
    last_position: CoordinatesInterface;
    is_charging: boolean;
    city_id: number;
}
