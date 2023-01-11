import React, {useEffect, useState} from 'react';
import "../css/Home.css";

import {UserTable} from "./UserTable";
import {UserForm} from "./UserForm";



export const Home = () => {

    const [users, setUsers] = useState([]);
    const [hasSearched, setHasSearched] = useState(false);
    const [userId, setUserId] = useState("");
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");



    useEffect(() => {
        const getAllUsers = async () => {
        const response = await fetch(`/users/`);
        return await response.json();
        }
        getAllUsers().then(r => setUsers(r));

    },[])


    return (
        <div className="home-wrapper">
        <UserForm
            setHasSearched={setHasSearched}
            setUserId={setUserId}
            setFirstName={setFirstName}
            setLastName={setLastName}



        />

            {
                <UserTable
                hasSearched={hasSearched}
                setHasSearched={setHasSearched}
                users={users}
                userId={userId}
                firstName={firstName}
                lastName={lastName}
                />
            }
        </div>
    );
}
