import Scooter from "./scooter";
import fetch from "node-fetch";

export default class Pool {
    protected scooters;

    getScooters() {
        return this.scooters;
    }

    async getScootersFromDb() {
        const requestOptions = {
            method: 'GET',
            headers: {'Content-Type': 'application/json'}
        };

        const response = await fetch(`http://localhost:3000/scooters/`, requestOptions);
        if (!response.ok) {
            throw new Error(response.statusText);
        }
        const result = await response.json();
        for (const s of result) {
            const scooter = new Scooter(
                s.id,
                s.enabled,
                s.available,
                s.inMaintenance,
                s.position,
                s.speed,
                s.charge
            );
            scooter.initiate();
            this.scooters[scooter.getId()] = scooter;
        }
    }

    getScooter(scooterId: number) {
        return this.scooters[scooterId];
    }

    setScooter(scooterId: number, scooter: Scooter) {
        this.scooters[scooterId] = scooter;
    }
}

/*            .then(response => {
                if (!response.ok) {
                    throw new Error(response.statusText);
                }
                // loop through and create/initiate bikes here
                response.json()
                    .then(r => {
                        for (let scooter of r) {
                            const scooter = new Scooter(
                                r.id,
                                r.enabled,
                                r.available,
                                r.inMaintenance,
                                r.position,
                                r.speed,
                                r.charge
                            );
                            scooter.initiate();
                            this.scooters.push(scooter);
                        }
                    })
            })*/

/*function create() {
    const scooter = new Scooter(
        1,
        false,
        false,
        false, '000',
        100, 30);
    scooter.sleep();

    return scooter;
}

function getScooters() {
    const requestOptions = {
        method: 'GET',
        headers: {'Content-Type': 'application/json'}
    };
    return fetch(`http://localhost:3000/scooters/`, requestOptions)
        .then(response => {
            if (!response.ok) {
                throw new Error(response.statusText);
            }
            // loop through and create/initiate bikes here
            response.json()
                .then(r => {
                    for (let scooter of r) {
                        const scooter = new Scooter(
                            r.id,
                            r.enabled,
                            r.available,
                            r.inMaintenance,
                            r.position,
                            r.speed,
                            r.charge
                        );
                        scooter.initiate();
                    }
                })
        })
}

function call(scooter: Scooter) {
    const requestOptions = {
        method: 'PUT',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(scooter.get())
    };
    return fetch(`http://localhost:3000/scooters/${scooter.getId()}`, requestOptions)
        .then(response => {
            if (!response.ok) {
                throw new Error(response.statusText);
            }
            return response.json();
        })
}

const scooter = create();
call(scooter).then(r => 'ignored');*/
