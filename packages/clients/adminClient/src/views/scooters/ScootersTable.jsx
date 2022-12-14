import React from 'react';
import "../css/ScootersTable.css";
import {useNavigate} from "react-router-dom";


export const ScootersTable = ({...props}) => {

    const navigate = useNavigate();
    const navigateScooterDetails = (id) =>{

        navigate('/scooterDetails', {state: {scooter: id, cities: props.cities}});
    };

    const createTables = () => {
        const tables = [];
        props.cities.forEach((city) => {
            tables.push(
                <div className="scooter-table-main">
                    <h2>{city.name}</h2>
                <div className="scooter-table-wrapper">
                <div className={`scooter-table`} key={city.id}>
                <table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Available</th>
                        <th>Enabled</th>
                        <th>Charging</th>
                    </tr>

                    </thead>
                    <tbody>

                    {props.scooters.map((scooter, index) => {
                        if (scooter.city_id === city.id) {
                            return (
                                <tr key={index} onClick={() => {navigateScooterDetails(scooter.id);}}>
                                    <td>{scooter.id}</td>
                                    <td>{scooter.available}</td>
                                    <td>{scooter.enabled}</td>
                                    <td>{scooter.is_charging}</td>
                                </tr>
                            )
                        }
                        return null;
                    })}

                    </tbody>
                </table>
                </div>
                </div>
                </div>
            )

        });
        return tables;
    };

    return (
        <div className="comp-wrapper">
            {createTables()}
        </div>
    );
}
