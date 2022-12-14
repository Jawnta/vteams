import React from 'react';

import "../css/UserDetails.css";

import { Outlet } from "react-router-dom";

export const UserDetailsMain = ({...props}) => {

    return (
        <div className="user-details">
            <Outlet context={[props.user, props.setUser]}
            />
        </div>
    );
}
