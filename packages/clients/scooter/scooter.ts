import fetch from "node-fetch";

export default class Scooter {
    protected id: number;
    protected available: boolean;
    protected enabled: boolean;
    protected charge: number;
    protected distance_traveled: number;
    protected last_position: string;
    protected is_charging: boolean;
    protected city_id: number;

    constructor(id: number, available: boolean, enabled: boolean,
                charge: number,
                distanceTraveled: number, lastPosition: string,
                isCharging: boolean, cityId: number)
    {
        this.id = id;
        this.available = available;
        this.enabled = enabled;
        this.charge = charge;
        this.distance_traveled = distanceTraveled;
        this.last_position = lastPosition;
        this.is_charging = isCharging;
        this.city_id = cityId;
    }

    get(): object {
        return {
            id: this.getId(),
            available: this.getAvailable(),
            enabled: this.getEnabled(),
            charge: this.getCharge(),
            distance_traveled: this.getDistanceTraveled(),
            last_position: this.getLastPosition(),
            is_charging: this.getIsCharging(),
            city_id: this.getCityId()
        }
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

    getLastPosition(): string {
        return this.last_position;
    }

    setLastPosition(lastPosition: string) {
        this.last_position = lastPosition;
    }

    getIsCharging(): boolean {
        return this.is_charging;
    }

    setIsCharging(isCharging: boolean) {
        this.is_charging = isCharging;
    }

    getCityId(): number {
        return this.city_id;
    }

    setCityId(cityId: number) {
        this.city_id = cityId;
    }

    getCharge(): number {
        return this.charge;
    }

    setCharge(charge: number) {
        this.charge = charge;
    }

    async sendReport() {
        const data = this.get();
        const requestOptions = {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)  
        };

        const response = await fetch(`http://localhost:1337/${this.getId()}`, requestOptions);
        if (!response.ok) {
            throw new Error(response.statusText);
        }
    }

    initiate() {
        if (this.getAvailable()) {
            this.setCharge(this.getCharge() - 0.1);
            this.sendReport();
            setTimeout(() => this.initiate(), 5000);
        } else {
            this.setCharge(this.getCharge() - 1);
            this.sendReport();
            setTimeout(() => this.initiate(), 2500);
        }
    }
}
