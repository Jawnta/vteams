interface ScooterParseInterface {
    id: number;
    available: boolean;
    enabled: boolean;
    charge: number;
    last_serviced: string;
    first_used: string | null;
    distance_traveled: number;
    last_position: {
        type: string;
        coordinates: [number, number];
    };
    is_charging: boolean;
    city_id: string;
}
export default ScooterParseInterface;
