import React, {useEffect, useState} from 'react';
import { useParams} from 'react-router-dom';
import "../css/UserDetails.css";
import {UserDetailsNav} from "./UserDetailsNav";
import {UserDetailsMain} from "./UserDetailsMain";

export const UserDetails = () => {
    const [user, setUser] = useState([]);

    const params = useParams();


    useEffect(() => {
        const getUser = async (id) => {
            const response = await fetch(`/users/${id}`);
            return await response.json();
        }
        getUser(params.userId).then(r => setUser(r[0]));
    },[params.userId])

    return (
        <div className="user-details">
            <UserDetailsNav
            userId={params.userId}
            />
            <div className="user-details-main">
            <UserDetailsMain
                user={user}
                setUser={setUser}
                userId={params.userId}
            />
            </div>
        </div>
    );
}
