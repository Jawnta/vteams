interface ParkingZonePost {
    id: string;
    city_id: string;
    area: {
      type: string;
      coordinates: number[][][];
    };
}
export default ParkingZonePost;
