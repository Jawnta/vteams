import Scooter from "./scooter";
import fetch from "node-fetch";

const scooterArr: Scooter[] = [];

function create() {
    const scooter = new Scooter(
        1,
        false,
        false,
        false, '000',
        100, 30);
    scooter.sleep();
    scooterArr.push(scooter);
}

async function conn() {
    for (const scooter of scooterArr) {
        const requestOptions = {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify(scooter.get())
        };
        fetch(`https://localhost:3000/scooters/${scooter.getId()}`, requestOptions).then(r => 'ignored');
    }
}

create();
conn().then(r => 'ignored');
