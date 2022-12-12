export default interface ScooterInterface {
    id: number,
    available: boolean,
    enabled: boolean,
    charge: number,
    distance_traveled: number,
    last_position: string
    is_charging: boolean
    city_id: number
}
