interface StopTripInterface {
    trip_id: number,
    stop_position: {
        type: string;
        coordinates: [number, number];
    };
}
export default StopTripInterface;