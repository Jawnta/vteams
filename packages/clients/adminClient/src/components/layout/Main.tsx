import React from 'react';
import { Outlet } from "react-router-dom";
import "../css/Main.css";

export const Main = ({...props}) => {
    return (
        <div className="main">
            <Outlet
                //@ts-ignore
                user={props.user}
                setUser={props.setUser}
            />
        </div>
    );
}
