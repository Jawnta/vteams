import React, {useEffect, useState} from 'react';
import "../css/Map.css";
import {MapView} from "./MapView";
export const Map = () => {
    const [scooters, setScooters] = useState([]);
    const [chargingStations, setChargingStations] = useState([]);
    const [chargingZones, setChargingZones] = useState([]);
    const [parkingZones, setParkingZones] = useState([]);
    const [forceUpdate, setForceUpdate] = useState([true]);


    useEffect(() => {
        const getScooters = async () => {

            const response = await fetch(`/scooters/`);
            return await response.json();
        };

        const getChargingStations = async () => {

            const response = await fetch(`/chargingstations/`);
            return await response.json();
        };

        const getChargingZones = async () => {
            const response = await fetch(`/chargingzones/`);
            return await response.json();
        };
        const getParkingZones = async () => {
            const response = await fetch(`/parkingzones/`);
            return await response.json();
        };

        getScooters().then(s => setScooters(s));
        getChargingStations().then(cs => setChargingStations(cs));
        getChargingZones().then(cz => setChargingZones(cz));
        getParkingZones().then(pz => setParkingZones(pz));
    }, [forceUpdate]);

    useEffect( () => {
        const getScooters = async () => {

            const response = await fetch(`/scooters/`);
            return await response.json();
        };


        const interval = setInterval(() => {
            getScooters().then(s => setScooters(s));
        }, 3000);


        return () => clearInterval(interval);

    },[]);


    return (
        <div className="map-wrapper">
            <MapView
                scooters={scooters}
                cstations={chargingStations}
                czones={chargingZones}
                pzones={parkingZones}
                forceUpdate={forceUpdate}
                setForceUpdate={setForceUpdate}
            />

        </div>
    )
}
