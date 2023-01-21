import Scooter from "./scooter";
import {OpenRouteServiceResponse} from "./interface/OpenRouteServiceResponse";
import ScooterInterface from "./interface/ScooterInterface";
import getRouteResponse from "./route";

export default class SimulationScooter extends Scooter {
    async getSelfFromDb(): Promise<Array<ScooterInterface>> {
        const scooterId = this.getId();
        const requestOptions = {
            method: 'GET',
            headers: {'Content-Type': 'application/json'}
        }
        const response = await fetch(`http://localhost:3000/scooters/${scooterId}`, requestOptions);
        return response.json();
    }

    setChanges(scooterArr: Array<ScooterInterface>) {
        const scooter = scooterArr[0];
        this.setAvailable(scooter.available);
        this.setEnabled(scooter.enabled);
        this.setIsCharging(scooter.is_charging);
        this.setDistanceTraveled(scooter.distance_traveled);
        this.setCharge(scooter.charge);
    }

    getRoute(): OpenRouteServiceResponse {
        return <OpenRouteServiceResponse>this.route;
    }

    async setRoute() {
        const response = await getRouteResponse(this);
        console.log('ROUTE RESPONSE');
        console.log(response);
        if (response.type === undefined) {
            await this.setRoute();
        }
        if (response.type !== undefined) {
            this.route = response;
            return;
        }
    }

    async sendReport() {
        const data = this.get();
        const requestOptions = {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)
        };
        const response = await fetch(`http://localhost:3000/scooters/${this.getId()}`, requestOptions);
        if (!response.ok) {
            throw new Error(response.statusText);
        }
    }

    async simulateMovement() {
        const routeResponse = this.getRoute();
        const currentCoords = routeResponse.features[0]?.geometry?.coordinates[this.routeIndex];
        if (currentCoords) {
            console.log('Current coordinates: ', currentCoords);
            const coordinatesObj = {type: "Point", coordinates: [currentCoords[1], currentCoords[0]]};
            this.setLastPosition(JSON.stringify(coordinatesObj));
            this.routeIndex++;
        }
    }

    async startTrip() {
        await this.setRoute();
        if (this.route !== undefined) {
            const userId = await this.getEligibleUser();
            const scooterId = this.id;
            const startPosition = this.last_position;
            const data = {
                user_id: userId,
                scooter_id: scooterId,
                start_position: startPosition
            }
            console.log('Trip started with data: ', data);
            const requestOptions = {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(data)
            }
            const response = await fetch(`http://localhost:3000/trips`, requestOptions);
            if (!response.ok) {
                throw new Error(response.statusText);
            }
            console.log(await response);
        }
    }

    async getEligibleUser() {
        const userId = Math.floor(Math.random() * (999 - 1) + 1);
        const response = await fetch(`http://localhost:3000/users/${userId}`);
        const result = await response.json();
        if (result.enabled === false) {
            await this.getEligibleUser();
        }
        return userId;
    }

    async endTrip() {
        console.log("Trip ended");
        const data = {
            scooter_id: this.getId(),
            stop_position: this.getLastPosition()
        }
        const requestOptions = {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(data)
        }
        // change link to be slash trip id
        const response = await fetch(`http://localhost:3000/trips`, requestOptions);
        if (!response.ok) {
            throw new Error(response.statusText);
        }
        await this.idle();
    }

    async updateFromDb() {
        const dbScooter = await this.getSelfFromDb();
        this.setChanges(dbScooter);
    }

    async simulateTrip() {
        console.log(this);
        if (this.getRoute() === undefined && this.getAvailable()) {
            await this.startTrip();
        }
        await this.updateFromDb();
        if (!this.possibleToContinue()) {
            await this.endTrip();
            return;
        }
        try {
            const routeResponse = this.getRoute();
            let duration = routeResponse.features[0]?.properties?.segments[0]?.steps[this.routeIndex]?.duration;
            duration = duration * 1000;
            this.setCharge(this.getCharge() - 0.3);
            await this.simulateMovement();
            await this.sendReport();
            console.log('Current leg duration: ', duration);
            setTimeout(() => this.simulateTrip(), duration);
        } catch (e) {
            await this.endTrip();
            return;
        }
    }

    possibleToContinue(): boolean {
        const routeResponse = this.getRoute();
        const route = routeResponse.features[0]?.geometry?.coordinates;
        console.log('Route index, ', this.routeIndex);
        console.log('Route length, ', route.length);
        return !(this.getCharge() < 0.4 || this.getAvailable() || !this.getEnabled() || this.routeIndex >= route.length);
    }

    async idle() {
        const duration = Math.random() * (70000 - 50000) + 50000;
        await this.sendReport();
        setTimeout(() => this.idle(), duration);
    }

    // async initiateRoute() {
    //     if (this.route === undefined) {
    //         await this.setRoute();
    //     }
    //     if (this.charge < 0.4) {
    //         await this.idle();
    //         // change to something more clear that maybe sends an exit msg or so
    //     }
    //     const dbScooter = await this.getSelfFromDb();
    //     this.setChanges(dbScooter);
    //     if (!this.getAvailable()) {
    //         // send put to trip
    //         await this.idle();
    //     }
    //     const routeResponse = this.getRoute();
    //     console.log(this);
    //     console.log(routeResponse);
    //     this.setCharge(this.getCharge() - 0.3);
    //     try {
    //         let duration = routeResponse.features[0]?.properties?.segments[0]?.steps[this.routeIndex]?.duration;
    //         duration = duration * 1000;
    //         await this.simulateMovement();
    //         await this.sendReport();
    //         setTimeout(() => this.initiateRoute(), duration);
    //     } catch (e) {
    //         await this.idle();
    //         return;
    //     }
    // }
}
