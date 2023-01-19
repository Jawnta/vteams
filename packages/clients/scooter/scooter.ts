import {CoordinatesInterface} from "./interface/CoordinatesInterface";
import {OpenRouteServiceResponse} from "./interface/OpenRouteServiceResponse";

export default class Scooter {
    protected id: number;
    protected available: boolean;
    protected enabled: boolean;
    protected charge: number;
    protected last_serviced: Date;
    protected first_used: Date | null;
    protected distance_traveled: number;
    protected last_position: CoordinatesInterface | string;
    protected is_charging: boolean;
    protected city_id: string;
    protected route: OpenRouteServiceResponse | undefined;
    protected routeIndex: number;

    constructor(id: number, available: boolean, enabled: boolean,
                charge: number, last_serviced: Date, first_used: Date | null,
                distanceTraveled: number, lastPosition: CoordinatesInterface | string,
                isCharging: boolean, cityId: string) {
        this.id = id;
        this.available = available;
        this.enabled = enabled;
        this.charge = charge;
        this.last_serviced = last_serviced;
        this.first_used = first_used;
        this.distance_traveled = distanceTraveled;
        this.last_position = lastPosition;
        this.is_charging = isCharging;
        this.city_id = cityId;
        this.routeIndex = 0;
    }

    get(): object {
        return {
            id: this.getId(),
            available: this.getAvailable(),
            enabled: this.getEnabled(),
            charge: this.getCharge(),
            first_used: this.getFirstUsed(),
            last_serviced: this.getLastServiced(),
            distance_traveled: this.getDistanceTraveled(),
            last_position: this.getLastPosition(),
            is_charging: this.getIsCharging(),
            city_id: this.getCityId()
        }
    }

    getFirstUsed(): Date | null {
        return this.first_used;
    }

    getId(): number {
        return this.id;
    }

    setId(id: number) {
        this.id = id;
    }

    getEnabled(): boolean {
        return this.enabled;
    }

    setEnabled(enabled: boolean) {
        this.enabled = enabled;
    }

    getAvailable(): boolean {
        return this.enabled && this.available;
    }

    setAvailable(available: boolean) {
        this.available = available;
    }

    getDistanceTraveled(): number {
        return this.distance_traveled;
    }

    setDistanceTraveled(distanceTraveled: number) {
        this.distance_traveled = distanceTraveled;
    }

    getLastServiced(): Date {
        return this.last_serviced;
    }

    getLastPosition(): CoordinatesInterface | string {
        return this.last_position;
    }

    setLastPosition(lastPosition: CoordinatesInterface | string) {
        this.last_position = lastPosition;
    }

    getIsCharging(): boolean {
        return this.is_charging;
    }

    setIsCharging(isCharging: boolean) {
        this.is_charging = isCharging;
    }

    getCityId(): string {
        return this.city_id;
    }

    setCityId(cityId: string) {
        this.city_id = cityId;
    }

    getCharge(): number {
        return this.charge;
    }

    setCharge(charge: number) {
        this.charge = charge;
    }
}
