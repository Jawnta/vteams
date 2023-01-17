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
exports.ScooterDetailsTable = void 0;
const react_1 = __importDefault(require("react"));
require("../css/ScooterDetailsTable.css");
const ScooterDetailsTable = (_a) => {
    var props = __rest(_a, []);
    const updateScooterTable = () => {
        return props.scooter.map((scooter, index) => {
            return (<tr key={index}>
                    <td>{scooter.id}</td>
                    <td>{scooter.available}</td>
                    <td>{scooter.enabled}</td>
                    <td>{scooter.charge}%</td>
                    <td>{scooter.last_serviced.toString()}</td>
                    <td>{!scooter.first_used ? "" : scooter.first_used.toString()}</td>
                    <td>{scooter.distance_traveled}</td>
                    <td>{scooter.is_charging}</td>
                    <td>{props.cities.map((city) => {
                    if (city.id === scooter.city_id) {
                        return city.name;
                    }
                    return null;
                })}</td>
                </tr>);
        });
    };
    return (<div className="scooter-details-table-wrapper">
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


        </div>);
};
exports.ScooterDetailsTable = ScooterDetailsTable;
