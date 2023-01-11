import React, {useEffect, useState} from 'react';
import "../css/Scooters.css";
import {ScootersTable} from "./ScootersTable";





export const Scooters = () => {

    const [scooters, setScooters] = useState([]);
    const [cities, setCities] = useState([]);

    useEffect(() => {
        const getScooters = async () => {

            const response = await fetch(`/scooters/`);
            return await response.json();
        };

        const getCities = async () => {
            const response = await fetch(`/cities/`);
            return await response.json();
        };
        getScooters().then(r => setScooters(r));
        getCities().then(r => setCities(r));
    }, []);


    return (
        <div className="scooter-wrapper">
            <div className="scooters">
                <ScootersTable
                    scooters={scooters}
                    cities={cities}
                />

            </div>

        </div>
    );
}
