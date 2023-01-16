import generateUrl from "./ors.conf";
import Scooter from "./scooter";

export default async function getRouteResponse(scooter: Scooter) {
    const [startLong, startLat] = getStartCoords(scooter);
    const start = `${startLong}, ${startLat}`;
    const [endLong, endLat] = getEndCoords(scooter);
    const end = `${endLong}, ${endLat}`;
    const url = generateUrl(start, end);
    const response = await fetch(url);
    return await response.json();
}

function getStartCoords(scooter: Scooter) {
    const lastPosition = JSON.parse(<string>scooter.getLastPosition()),
        longitude = lastPosition.coordinates[0],
        latitude = lastPosition.coordinates[1];
    return [longitude, latitude];
}

function getEndCoords(scooter: Scooter) {
    let latitude;
    let longitude;
    const generateRandomCoords = (min: number, max: number) => {
        return Math.random() * (max - min) + min;
    }
    // probably switch case here
    // set min and max to something
    switch (scooter.getCityId()) {
        case 1:
            // karlskrona
            latitude = generateRandomCoords(56.15739003028504, 56.16442770638836);
            longitude = generateRandomCoords(15.582790158591905, 15.592471257353171);
    }
    return [longitude, latitude];
}
