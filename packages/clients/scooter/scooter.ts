import {CoordinatesInterface} from "./interface/CoordinatesInterface";
import getRouteResponse from "./route";
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
    protected city_id: number;
    protected route: OpenRouteServiceResponse | undefined;
    protected routeIndex: number;

    constructor(id: number, available: boolean, enabled: boolean,
                charge: number, last_serviced: Date, first_used: Date | null,
                distanceTraveled: number, lastPosition: CoordinatesInterface | string,
                isCharging: boolean, cityId: number) {
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
        console.log(requestOptions.body);
        const response = await fetch(`http://api:3000/scooters/${this.getId()}`, requestOptions);
        if (!response.ok) {
            throw new Error(response.statusText);
        }
    }

    async simulateMovement() {
        const routeResponse = this.getRoute();
        const currentCoords = routeResponse.features[0]?.geometry?.coordinates[this.routeIndex];
        if (currentCoords) {
            const coordinatesObj = {type: "Point", coordinates: [currentCoords[0], currentCoords[1]]};
            this.setLastPosition(JSON.stringify(coordinatesObj));
            this.routeIndex++;
        }
    }

    async initiateRoute() {
        if (this.getAvailable()) {
            if (this.route === undefined) {
                await this.setRoute();
            }
            const routeResponse = this.getRoute();
            console.log("SCOOTER ID, ", this.getId());
            console.log(routeResponse);
            this.setCharge(this.getCharge() - 0.3);
            try {
                let duration = routeResponse.features[0]?.properties?.segments[0]?.steps[this.routeIndex]?.duration;
                duration = duration * 1000;
                await this.simulateMovement();
                await this.sendReport();
                setTimeout(() => this.initiateRoute(), duration);
            } catch (e) {
                await this.idle();
                return;
            }
        }
    }

    async setRoute() {
        this.route = await getRouteResponse(this);
    }

    getRoute(): OpenRouteServiceResponse {
        return <OpenRouteServiceResponse>this.route;
    }

    async idle() {
        const duration = 60000;
        await this.sendReport();
        setTimeout(() => this.idle(), duration);
    }

    // async initiate() {
    //     if (this.route === null) {
    //         await this.setRoute();
    //     }
    //     if (this.getAvailable()) {
    //         this.setCharge(this.getCharge() - 0.3);
    //         const currentCoords = this.route.features[0].geometry.coordinates[this.routeIndex];
    //         const coordinatesObj = {type: "Point", coordinates: [currentCoords[0], currentCoords[1]]};
    //         this.setLastPosition(JSON.stringify(coordinatesObj));
    //         this.routeIndex++;
    //         await this.sendReport();
    //         setTimeout(() => this.initiate(), 10000);
    //     } else {
    //         this.setCharge(this.getCharge() - 0.1);
    //         await this.sendReport();
    //         setTimeout(() => this.initiate(), 10000);
    //     }
    // }
    //

    //
    // async startRoute() {
    //     console.log(this);
    //     const route = await getRouteResponse(this);
    //     console.log(route);
    //     let segment;
    //     let longitude;
    //     let latitude;
    //     for (segment of route.features[0].geometry.coordinates) {
    //         longitude = segment[0];
    //         latitude = segment[1];
    //         this.last_position = JSON.stringify({type: "Point", coordinates: [longitude, latitude]});
    //         await this.sendReport();
    //         setTimeout(() => null, 5000);
    //     }
    // }
}
