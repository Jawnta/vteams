import {CoordinatesInterface} from './coordinatesInterface';

export interface TripInterface {
    id: number;
    user_id: number;
    scooter_id: number;
    distance: number;
    completed: boolean;
    start_position: CoordinatesInterface;
    stop_position: CoordinatesInterface;
    start_time: Date;
    stop_time: Date;
}
