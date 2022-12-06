import Scooter from "./scooter";
import fetch from "node-fetch";

function create() {
    const scooter = new Scooter(
        1,
        false,
        false,
        false, '000',
        100, 30);
    scooter.sleep();

    return scooter;
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
call(scooter).then(r => 'ignored');
