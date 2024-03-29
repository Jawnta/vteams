import Scooter from "./scooter";
import ScooterInterface from "./interface/ScooterInterface";
import SimulationScooter from "./simulationScooter";

export default class Pool {
    protected scooters: Scooter[];

    constructor() {
        this.scooters = [];
    }

    getScooters() {
        return this.scooters;
    }

    getScootersFromDb() {
        const requestOptions = {
            method: 'GET',
            headers: {'Content-Type': 'application/json'}
        };

        return fetch(`http://api:3000/scooters/`, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error(response.statusText);
                }
                return response.json();
            })
    }

    async populate(res: ScooterInterface[]) {
        const timer = (ms: number | undefined) => new Promise(res => setTimeout(res, ms))
        if (Array.isArray(res)) {
            // const scooter = new SimulationScooter(
            //     res[0].id,
            //     true,
            //     res[0].enabled,
            //     res[0].charge,
            //     res[0].last_serviced,
            //     res[0].first_used,
            //     res[0].distance_traveled,
            //     res[0].last_position,
            //     res[0].is_charging,
            //     res[0].city_id
            // )
            // if (scooter.getAvailable()) {
            //     await scooter.simulateTrip();
            // } else {
            //     await scooter.idle();
            // }
            //
            // this.scooters[scooter.getId()] = scooter;
            res = res.sort((a, b) => 0.5 - Math.random());
            for (const s of res) {
                const scooter = new SimulationScooter(
                    s.id,
                    s.available,
                    s.enabled,
                    s.charge,
                    s.last_serviced,
                    s.first_used,
                    s.distance_traveled,
                    s.last_position,
                    s.is_charging,
                    s.city_id
                );
                if (scooter.getId() % 2 == 0) {
                    if (scooter.getAvailable()) {
                        await scooter.simulateTrip();
                    } else {
                        await scooter.idle();
                    }
                } else {
                    await scooter.idle();
                }
                this.scooters[scooter.getId()] = scooter;
                await timer(1200);
            }
        } else {
            throw new Error('res not of type array');
        }
    }

    scooterExists(scooterId: number): boolean {
        return scooterId in this.scooters;
    }

    getScooter(scooterId: number): Scooter {
        return this.scooters[scooterId];
    }

    setScooter(scooterId: number, scooter: ScooterInterface): Scooter {
        const updatedScooter = new Scooter(
            scooter.id,
            scooter.available,
            scooter.enabled,
            scooter.charge,
            scooter.last_serviced,
            scooter.first_used,
            scooter.distance_traveled,
            scooter.last_position,
            scooter.is_charging,
            scooter.city_id
        );
        this.scooters[scooterId] = updatedScooter;
        return updatedScooter;
    }
}
