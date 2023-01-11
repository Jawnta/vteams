import React, {useState} from "react";
import { Link } from "react-router-dom";
import "../css/UserDetailNav.css";

export const UserDetailsNav = () => {
    const [active, setActive] = useState(false);

    return (
        <div className="user-details-navbar">
            <nav>
                <ul>
                    <li
                        // @ts-ignore
                        className={active ? null : 'active'}>
                        <Link to={`overview`} onClick={() => {setActive(false)}}>Customer</Link>
                    </li>
                    <li
                        // @ts-ignore
                        className={active ? 'active' : null}>
                        <Link to={`invoices`} onClick={() => {setActive(true)}}>Invoices</Link>
                    </li>
                </ul>
            </nav>
        </div>
    );
}
