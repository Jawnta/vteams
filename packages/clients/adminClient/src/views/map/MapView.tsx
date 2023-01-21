import React, {useRef} from 'react';
import {MapContainer, TileLayer, Marker, Popup, Polygon, } from 'react-leaflet'
import 'leaflet/dist/leaflet.css';
import "../css/Map.css";
// @ts-ignore
import L from 'leaflet';
import {enableScooter, disableScooter} from "../../endpoints/ScooterEndpoints";
import scooterIcon from '../img/scooter.png';
import csIconG from '../img/greenMarker.png';
import csIconR from '../img/redMarker.png';




const iconS = new L.Icon({
    iconUrl: scooterIcon,
    iconRetinaUrl: scooterIcon,
    popupAnchor:  [-0, -0],
    iconSize: [32,45],
});

const iconCsG = new L.Icon({
    iconUrl: csIconG,
    iconRetinaUrl: csIconG,
    popupAnchor:  [-0, -0],
    iconSize: [8,8],
});

const iconCsR = new L.Icon({
    iconUrl: csIconR,
    iconRetinaUrl: csIconR,
    popupAnchor:  [-0, -0],
    iconSize: [8,8],
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

    const createParkingZonePolygons = () => {
        const polygonList: { id: number; cid: number; area: {coordinates: Array<Array<Number>>}; }[] = [];

        props.pzones.forEach((pz: { id: number; city_id: number; area: string; }) => {
                const area:{coordinates: Array<Array<Number>>} = JSON.parse(pz.area);
                const data = {
                    id: pz.id,
                    cid: pz.city_id,
                    area: area
                };
                polygonList.push(data);
            }
        )
        return polygonList;
    };


    const createCzPolygonMarker = (data: { id: number; pid: number; area: { coordinates: Number[][]; }; }[]) => {
        let latLongs: { id: number; pid: number; coords: Number[]; }[] = [];
        data.forEach(x => {
            latLongs.push({
                id: x.id,
                pid: x.pid,
                coords: x.area.coordinates[0]
            });

        });
        return latLongs;
    };

    const createPzPolygonMarker = (data: { id: number; cid: number; area: { coordinates: Number[][]; }}[]) => {
        let latLongs: { id: number; pid: number; coords: Number[]; }[] = [];
        data.forEach(x => {
            latLongs.push({
                id: x.id,
                pid: x.cid,
                coords: x.area.coordinates[0]
            });

        });
        return latLongs;
    };


    const chargingZones = createChargingZonePolygons();
    const parkingZones = createParkingZonePolygons()

    const chargingZoneMarkers = createCzPolygonMarker(chargingZones);
    const parkingZoneMarkers = createPzPolygonMarker(parkingZones);

    const purple = { color: 'purple' }
    const green = { color: 'green'}


    const mapRef: any = useRef();
    function handleOnFlyTo(latLong: Array<number>) {
        mapRef.current.setView(latLong, 13);
    }


    if (parkingZoneMarkers.length < 1) {
        return (
            <div>
                <p>Loading...</p>
            </div>
        )
    }
    
    const Karlskrona: number[] = [56.16149014522431, 15.58699586271063];
    const Jonkoping: number[] = [57.78145, 14.15618];
    const Stockholm: number[] = [59.33258, 18.0649];

    return (
        <div className="map-view-wrapper">
            <div className="change-city">
                <button onClick={() => {handleOnFlyTo(Karlskrona)}}>Karlskrona</button>
                <button onClick={() => {handleOnFlyTo(Jonkoping)}}>Jönköping</button>
                <button onClick={() => {handleOnFlyTo(Stockholm)}}>Stockholm</button>
            </div>
            <div className="map-main">

                <MapContainer
                    //@ts-ignore
                    center={[56.16149014522431, 15.58699586271063]}
                    zoom={13}
                    style={{ height: '100vh', width: '100wh' }}
                    ref={mapRef}
                >

                    <TileLayer
                        //@ts-ignore
                        attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
                        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
                    />
                    {
                        createScooterMarkers().map((scooter) => (
                            <Marker position={[scooter.position.coordinates[0], scooter.position.coordinates[1]]}
                                    //@ts-ignore
                                    icon={iconS}
                            >
                            <Popup>
                                Id: {scooter.id}
                                <br/>
                                Battery: {scooter.battery}%
                                <br/>
                                Charging: {!scooter.charging ? "No" : "Yes"}
                                <br />
                                Enabled: {!scooter.enabled ? "No" : "Yes"}
                                <br />
                                {!scooter.enabled ? <button
                                    onClick={
                                        async () => {
                                            await enableScooter(scooter.id);
                                            !props.forceUpdate ? props.setForceUpdate(true) : props.setForceUpdate(false)
                                        }
                                    }>
                                    Activate
                                </button>
                                    :
                                    <button
                                        onClick={
                                            async () => {
                                                await disableScooter(scooter.id);
                                                !props.forceUpdate ? props.setForceUpdate(true) : props.setForceUpdate(false)
                                            }
                                            }
                                    >
                                        Disable
                                    </button>}
                            </Popup>
                            </Marker>
                        ))
                    }

                    {
                        createChargingStationMarkers().map((cs) => (
                            <Marker
                                position={[cs.position.coordinates[0], cs.position.coordinates[1]]}
                                //@ts-ignore
                                    icon={!cs.occupied ? iconCsG : iconCsR}>
                                <Popup>
                                    Id: {cs.id}
                                    <br/>
                                    Occupied: {!cs.occupied ? "No" : "Yes"}
                                </Popup>

                            </Marker>
                        ))
                    }

                    {
                        parkingZoneMarkers.map((pz) => (
                            <Polygon pathOptions={purple} positions={pz.coords}>
                                <Popup>
                                    Parkingzone: {pz.pid}
                                </Popup>

                            </Polygon>
                        ))
                    }

                    {

                        chargingZoneMarkers.map((cz) => (
                            <Polygon pathOptions={green} positions={cz.coords}>
                                <Popup>
                                    Chargingzone: {cz.pid}
                                </Popup>
                            </Polygon>
                        ))
                    }

                </MapContainer>
            </div>


            </div>

    )
}

