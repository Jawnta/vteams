import karlskrona from "./karlskrona";

function bbox(polygon: Array<Array<number>>): Array<number> {
    let longitude;
    let latitude;
    let maxLong = -181;
    let minLong = 181;
    let maxLat = -181;
    let minLat = 181;
    for (const coords of polygon) {
        longitude = coords[0];
        latitude = coords[1];
        if (maxLong < longitude) {
            maxLong = longitude;
        }
        if (minLong > longitude) {
            minLong = longitude;
        }
        if (maxLat < latitude) {
            maxLat = latitude;
        }
        if (minLat > latitude) {
            minLat = latitude;
        }
    }
    return [minLong, minLat, maxLong, maxLat];
}

const bboxes = {
    kna: bbox(karlskrona)
}

export default bboxes;
