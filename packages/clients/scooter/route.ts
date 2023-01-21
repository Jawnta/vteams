import generateUrl from "./ors.conf";
import Scooter from "./scooter";
import bboxes from "./polygons/bboxes";

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
        latitude = lastPosition.coordinates[0],
        longitude = lastPosition.coordinates[1];
    return [longitude, latitude];
}

function getEndCoords(scooter: Scooter) {
    let latitude;
    let longitude;
    let bbox;
    const generateRandomCoords = (min: number, max: number) => {
        return Math.random() * (max - min) + min;
    }
    switch (scooter.getCityId()) {
        case 'kna':
            bbox = bboxes.kna;
            latitude = generateRandomCoords(bbox[1], bbox[3]);
            longitude = generateRandomCoords(bbox[0], bbox[2]);
            break;
        case 'jkpg':
            bbox = bboxes.jkpg;
            latitude = generateRandomCoords(bbox[1], bbox[3]);
            longitude = generateRandomCoords(bbox[0], bbox[2]);
            break;
        case 'sthlm':
            bbox = bboxes.sthlm;
            latitude = generateRandomCoords(bbox[1], bbox[3]);
            longitude = generateRandomCoords(bbox[0], bbox[2]);
            break;
    }
    return [longitude, latitude];
}
