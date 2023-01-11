import React from 'react';
import "../css/ScootersTable.css";
import {useNavigate} from "react-router-dom";
import {ScooterInterface} from "../../components/interfaces/scooterInterface";
import {CityInterface} from "../../components/interfaces/cityInterface";


export const ScootersTable = ({...props}) => {

    const navigate = useNavigate();
    const navigateScooterDetails = (id: number) =>{

        navigate('/scooterDetails', {state: {scooter: id, cities: props.cities}});
    };

    const createTables = () => {
        const tables: JSX.Element[] = [];
        props.cities.forEach((city: CityInterface) => {
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

                    {props.scooters.map((scooter: ScooterInterface, index: number) => {
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
