import React, {useEffect, useState} from 'react';
import "../css/ScooterDetails.css";
import {useLocation} from "react-router-dom";
import {ScooterDetailsTable} from "./ScooterDetailsTable";

export const ScooterDetails = () => {

    const location = useLocation();
    const [scooter, setScooter] = useState([]);


    useEffect(() => {
        const getScooter = async (id) => {

            const response = await fetch(`/scooters/${id}`);
            return await response.json();
        };
        getScooter(location.state.scooter).then(r => setScooter(r));

    }, [location.state]);


    return (
        <div className="scooter-details-wrapper">
            <h1>Scooter details</h1>
            <ScooterDetailsTable
                scooter={scooter}
                cities={location.state.cities}
            />
        </div>
    );
}
