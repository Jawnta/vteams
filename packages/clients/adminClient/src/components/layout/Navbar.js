"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Navbar = void 0;
const react_1 = __importDefault(require("react"));
const react_router_dom_1 = require("react-router-dom");
require("../css/Navbar.css");
const Navbar = () => {
    return (<div className="navbar">
            <nav>
                <ul>
                    <li>
                        <react_router_dom_1.Link to="/">Start</react_router_dom_1.Link>
                    </li>
                    <li>
                        <react_router_dom_1.Link to="/map">Map</react_router_dom_1.Link>
                    </li>
                    <li>
                        <react_router_dom_1.Link to="/scooters">Scooters</react_router_dom_1.Link>
                    </li>
                    <li>
                        <react_router_dom_1.Link onClick={() => {
            localStorage.removeItem("token");
            window.location.reload();
        }} to={""}>Log out</react_router_dom_1.Link>
                    </li>
                </ul>
            </nav>
        </div>);
};
exports.Navbar = Navbar;
