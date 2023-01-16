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
exports.ScootersTable = void 0;
const react_1 = __importDefault(require("react"));
require("../css/ScootersTable.css");
const react_router_dom_1 = require("react-router-dom");
const ScootersTable = (_a) => {
    var props = __rest(_a, []);
    const navigate = (0, react_router_dom_1.useNavigate)();
    const navigateScooterDetails = (id) => {
        navigate('/scooterDetails', { state: { scooter: id, cities: props.cities } });
    };
    const createTables = () => {
        const tables = [];
        props.cities.forEach((city) => {
            tables.push(<div className="scooter-table-main">
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
                        return (<tr key={index} onClick={() => { navigateScooterDetails(scooter.id); }}>
                                    <td>{scooter.id}</td>
                                    <td>{scooter.available}</td>
                                    <td>{scooter.enabled}</td>
                                    <td>{scooter.is_charging}</td>
                                </tr>);
                    }
                    return null;
                })}

                    </tbody>
                </table>
                </div>
                </div>
                </div>);
        });
        return tables;
    };
    return (<div className="comp-wrapper">
            {createTables()}
        </div>);
};
exports.ScootersTable = ScootersTable;
