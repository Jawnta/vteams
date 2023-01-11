import React from "react";
import { Link } from "react-router-dom";
import "../css/Navbar.css";

export const Navbar = () => {
    return (
        <div className="navbar">
            <nav>
                <ul>
                    <li>
                        <Link to="/">Start</Link>
                    </li>
                    <li>
                        <Link to="/map">Map</Link>
                    </li>
                    <li>
                        <Link to="/scooters">Scooters</Link>
                    </li>
                    <li>
                        <Link onClick={() => {
                            localStorage.removeItem("token")
                            window.location.reload()
                        }
                        }>Log out</Link>
                    </li>
                </ul>
            </nav>
        </div>
    );
}
