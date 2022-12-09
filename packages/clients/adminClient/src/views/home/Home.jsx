import React, {useEffect, useState} from 'react';
import "../css/Home.css";

import {Link} from "react-router-dom";
import {UserTable} from "./UserTable";
import {UserForm} from "./UserForm";



export const Home = ({...props}) => {
    const { children } = this.props
    const [users, setUsers] = useState([]);
    const [hasSearched, setHasSearched] = useState(false);
    useEffect(() => {
        const getUsersLol = async () => {
        const response = await fetch(`/users/`);
        return await response.json();
        }
        getUsersLol().then(r => setUsers(r));

    },[])


    return (
        <div className="home-wrapper">
        <UserForm
            setHasSearched={setHasSearched}

        />

            {
                <UserTable
                hasSearched={hasSearched}
                users={users}
                filterId={props.userId}
                />
            }
        </div>
    );
}
