import React from 'react';
import "../css/ScooterDetailsTable.css";

export const ScooterDetailsTable = ({...props}) => {

    const updateScooterTable = () => {

        return props.scooter.map((scooter, index) => {
            return(
                <tr key={index}>
                    <td>{scooter.id}</td>
                    <td>{scooter.available}</td>
                    <td>{scooter.enabled}</td>
                    <td>{scooter.charge}%</td>
                    <td>{scooter.last_serviced}</td>
                    <td>{scooter.first_used}</td>
                    <td>{scooter.distance_traveled}</td>
                    <td>{scooter.is_charging}</td>
                    <td>{props.cities.map((city) => {
                        if (city.id === scooter.city_id) {
                            return city.name;
                    }
                        return null;
                    })}</td>
                </tr>
            )
        })
    };

    return (
        <div className="scooter-details-table-wrapper">
            <div className="user-table-wrapper">
                <div className="user-table">
                    <table>
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Available</th>
                            <th>Enabled</th>
                            <th>Battery</th>
                            <th>Last serviced</th>
                            <th>First used</th>
                            <th>Distance traveled</th>
                            <th>Charging</th>
                            <th>City</th>

                        </tr>
                        </thead>
                        <tbody>
                        {updateScooterTable()}
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    );
}
