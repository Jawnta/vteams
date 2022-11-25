export interface Admin {
    id: number,
    email: string
}

export interface User {
    first_name: string,
    last_name: string,
    phone_number: number,
    email: string,
    register_data: Date,
    social_security: string,
    enabled: boolean,
    credit: number,
    token: string
}

export interface Trip {
    id: number,
    user_id: number,
    scooter_id: number,
    distance: number,
    completed: boolean,
    start_position: number,
    stop_position: number,
    start_time: Date,
    stop_time: Date
}

export interface Invoice {
    id: number,
    trip_id: number,
    status: string,
    amount: number
}

export interface Scooter {
    id: number,
    available: boolean,
    enabled: boolean,
    charge: number,
    last_serviced: Date,
    first_used: Date,
    distance_traveled: number,
    last_position: number,
    city_id: number
}

export interface Scooter_log {
    id: number,
    scooter_id: number,
    speed: number,
    position: number,
    status: string,
    timestamp: Date,
    charge: number
}

export interface MaintenanceLog {
    id: number,
    scooter_id: number,
    timestamp: Date,
    event: string,
    invoked_by: string
}

export interface ChargingZone {
    id: number,
    parking_zone_id: number,
    area: number
}

export interface ChargingStation {
    id: number,
    charging_zone_id: number,
    position: number,
    occupied: boolean,
    scooter_id: number
}

export interface ParkingZone {
    id: number,
    city: number,
    area: number
}

export interface City {
    id: number,
    name: string
}
