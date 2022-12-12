import React, {useEffect, useState} from 'react';
import {UserDetailsForm} from "./UserDetailsForm";
import { useParams} from 'react-router-dom';
import "../css/UserDetails.css";

export const UserDetails = ({...props}) => {
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
            <h1>Customer details</h1>
            <UserDetailsForm
                user={user}
                setUser={setUser}
            />
        </div>
    );
}
