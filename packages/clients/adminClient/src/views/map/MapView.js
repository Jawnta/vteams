"use strict";
var __rest = (this && this.__rest) || function (s, e) {
    var t = {};
    for (var p in s) if (Object.prototype.hasOwnProperty.call(s, p) && e.indexOf(p) < 0)
        t[p] = s[p];
    if (s != null && typeof Object.getOwnPropertySymbols === "function")
        for (var i = 0, p = Object.getOwnPropertySymbols(s); i < p.length; i++) {
            if (e.indexOf(p[i]) < 0 && Object.prototype.propertyIsEnumerable.call(s, p[i]))
                t[p[i]] = s[p[i]];
        }
    return t;
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MapView = void 0;
const react_1 = __importDefault(require("react"));
const react_leaflet_1 = require("react-leaflet");
require("leaflet/dist/leaflet.css");
require("../css/Map.css");
// @ts-ignore
const leaflet_1 = __importDefault(require("leaflet"));
const scooter_png_1 = __importDefault(require("../img/scooter.png"));
const chargingstation_png_1 = __importDefault(require("../img/chargingstation.png"));
const iconS = new leaflet_1.default.Icon({
    iconUrl: scooter_png_1.default,
    iconRetinaUrl: scooter_png_1.default,
    popupAnchor: [-0, -0],
    iconSize: [32, 45],
});
const iconCs = new leaflet_1.default.Icon({
    iconUrl: chargingstation_png_1.default,
    iconRetinaUrl: chargingstation_png_1.default,
    popupAnchor: [-0, -0],
    iconSize: [32, 45],
});
const MapView = (_a) => {
    var props = __rest(_a, []);
    const createScooterMarkers = () => {
        const markerList = [];
        props.scooters.forEach((scooter) => {
            const last_position = JSON.parse(scooter.last_position);
            const data = {
                id: scooter.id,
                battery: scooter.charge,
                charging: scooter.is_charging,
                enabled: scooter.enabled,
                position: last_position
            };
            markerList.push(data);
        });
        return markerList;
    };
    const createChargingStationMarkers = () => {
        const markerList = [];
        props.cstations.forEach((cs) => {
            const position = JSON.parse(cs.position);
            const data = {
                id: cs.id,
                occupied: cs.occupied,
                position: position
            };
            markerList.push(data);
            console.log(markerList);
        });
        return markerList;
    };
    const createChargingZonePolygons = () => {
        const polygonList = [];
        props.czones.forEach((cz) => {
            const area = JSON.parse(cz.area);
            const data = {
                id: cz.id,
                pid: cz.parking_zone_id,
                area: area
            };
            polygonList.push(data);
        });
        return polygonList;
    };
    const test = createChargingZonePolygons();
    let latLongs = [];
    test.forEach(x => {
        latLongs.push(x.area.coordinates[0][0]);
        latLongs.push(x.area.coordinates[0][1]);
        latLongs.push(x.area.coordinates[0][2]);
    });
    const purpleOptions = { color: 'purple' };
    return (<div className="map-main">

                <react_leaflet_1.MapContainer 
    //@ts-ignore
    center={[56.16149014522431, 15.58699586271063]} zoom={13} style={{ height: '100vh', width: '100wh' }}>

                    <react_leaflet_1.TileLayer 
    //@ts-ignore
    attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors' url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"/>
                    {createScooterMarkers().map((scooter) => (<react_leaflet_1.Marker position={[scooter.position.coordinates[1], scooter.position.coordinates[0]]} 
        //@ts-ignore
        icon={iconS}>
                            <react_leaflet_1.Popup>
                                Id: {scooter.id}
                                <br />
                                Battery: {scooter.battery}%
                                <br />
                                Charging: {!scooter.charging ? "No" : "Yes"}
                                <br />
                                Enabled: {!scooter.enabled ? "No" : "Yes"}
                                <br />
                                <button>{!scooter.enabled ? "Activate" : "Deactivate"}</button>
                            </react_leaflet_1.Popup>
                            </react_leaflet_1.Marker>))}

                    {createChargingStationMarkers().map((cs) => (<react_leaflet_1.Marker position={[cs.position.coordinates[0], cs.position.coordinates[1]]} 
        //@ts-ignore
        icon={iconCs}>
                                <react_leaflet_1.Popup>
                                    Id: {cs.id}
                                    <br />
                                    Occupied: {!cs.occupied ? "No" : "Yes"}
                                </react_leaflet_1.Popup>

                            </react_leaflet_1.Marker>))}

                    <react_leaflet_1.Polygon pathOptions={purpleOptions} positions={latLongs}>
                        <react_leaflet_1.Popup>
                            test
                        </react_leaflet_1.Popup>
                    </react_leaflet_1.Polygon>

                </react_leaflet_1.MapContainer>
            </div>);
};
exports.MapView = MapView;
