import React from 'react';
import { Outlet } from "react-router-dom";
import "../css/Main.css";

export const Main = () => {
    return (
        <div className="main">
            <Outlet />
        </div>
    );
}
