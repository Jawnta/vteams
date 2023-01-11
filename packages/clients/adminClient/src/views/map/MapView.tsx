import React from 'react';
import { MapContainer, TileLayer, Marker, Popup, Polygon } from 'react-leaflet'
import 'leaflet/dist/leaflet.css';
import "../css/Map.css";
// @ts-ignore
import L from 'leaflet';
import scooterIcon from '../img/scooter.png';
import csIcon from '../img/chargingstation.png';


const iconS = new L.Icon({
    iconUrl: scooterIcon,
    iconRetinaUrl: scooterIcon,
    popupAnchor:  [-0, -0],
    iconSize: [32,45],
});

const iconCs = new L.Icon({
    iconUrl: csIcon,
    iconRetinaUrl: csIcon,
    popupAnchor:  [-0, -0],
    iconSize: [32,45],
});

export const MapView = ({...props}) => {

    const createScooterMarkers = () => {

        const markerList: { id: number; battery: number; charging: boolean; enabled: boolean; position: {coordinates: Array<Number>}; }[] = [];

        props.scooters.forEach((scooter: {
            id: number; charge: number; is_charging: boolean; enabled: boolean; last_position: string; }) => {
            const last_position: {coordinates: Array<Number>} = JSON.parse(scooter.last_position)
            const data = {
                id: scooter.id,
                battery: scooter.charge,
                charging: scooter.is_charging,
                enabled: scooter.enabled,
                position: last_position
            };

            markerList.push(data);

        });
        return markerList
    };

    const createChargingStationMarkers = () => {

        const markerList: { id: number; occupied: boolean; position: {coordinates: Array<Number>};}[] = [];

        props.cstations.forEach((cs: { id: number; occupied: boolean; position: string;}) => {
            const position: {coordinates: Array<Number>} = JSON.parse(cs.position)
            const data = {
                id: cs.id,
                occupied: cs.occupied,
                position: position
            };

            markerList.push(data);
            console.log(markerList);
        });
        return markerList
    };

    const createChargingZonePolygons = () => {
        const polygonList: { id: number; pid: number; area: {coordinates: Array<Array<Number>>}; }[] = [];

        props.czones.forEach((cz: { id: number; parking_zone_id: number; area: string; }) => {
            const area:{coordinates: Array<Array<Number>>} = JSON.parse(cz.area);
            const data = {
                id: cz.id,
                pid: cz.parking_zone_id,
                area: area
            };
            polygonList.push(data);
        }
        )

        return polygonList;
    };

    const test = createChargingZonePolygons();
    let latLongs: Array<Number> = [];
    test.forEach(x => {
        latLongs.push(x.area.coordinates[0][0]);
        latLongs.push(x.area.coordinates[0][1]);
        latLongs.push(x.area.coordinates[0][2]);
    });

    const purpleOptions = { color: 'purple' }


    return (
            <div className="map-main">

                <MapContainer
                    //@ts-ignore
                    center={[56.16149014522431, 15.58699586271063]} zoom={13}
                              style={{ height: '100vh', width: '100wh' }}
                >

                    <TileLayer
                        //@ts-ignore
                        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    />
                    {
                        createScooterMarkers().map((scooter) => (
                            <Marker position={[scooter.position.coordinates[1], scooter.position.coordinates[0]]}
                                    //@ts-ignore
                                    icon={iconS}>
                            <Popup>
                                Id: {scooter.id}
                                <br/>
                                Battery: {scooter.battery}%
                                <br/>
                                Charging: {!scooter.charging ? "No" : "Yes"}
                                <br />
                                Enabled: {!scooter.enabled ? "No" : "Yes"}
                                <br />
                                <button>{!scooter.enabled ? "Activate" : "Deactivate"}</button>
                            </Popup>
                            </Marker>
                        ))
                    }

                    {
                        createChargingStationMarkers().map((cs) => (
                            <Marker
                                position={[cs.position.coordinates[0], cs.position.coordinates[1]]}
                                //@ts-ignore
                                    icon={iconCs}>
                                <Popup>
                                    Id: {cs.id}
                                    <br/>
                                    Occupied: {!cs.occupied ? "No" : "Yes"}
                                </Popup>

                            </Marker>
                        ))
                    }

                    <Polygon pathOptions={purpleOptions} positions={latLongs}>
                        <Popup>
                            test
                        </Popup>
                    </Polygon>

                </MapContainer>
            </div>
    )
}
