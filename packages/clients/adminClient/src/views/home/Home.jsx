import React, {useEffect, useState} from 'react';
import "./css/Home.css";

import {Link} from "react-router-dom";



export const Home = () => {
    const [value, setValue] = useState('')
    const [users, setUsers] = useState([]);
    const [loopedUsers, setLoopedUsers] = useState([]);

    const isEmpty = !loopedUsers;

    useEffect(() => {
        const getUsersLol = async () => {
        const response = await fetch(`/users/`);
        return await response.json();
        }
        getUsersLol().then(r => setUsers(r));
        
    },[])
    const handleSubmit = (event) => {
        event.preventDefault();
    };


    const loopUsers = () => {
        const userList = [];
        for (let i = 0; i < 50; i++) {
            userList.push(users[i])
        }
        setLoopedUsers(userList);
    };


    useEffect(()=>{},[loopedUsers])


    return (
        <div className="home-wrapper">
        <div className="home-form">
            <form>
                <label>User id</label>
                <input
                    id="f_userId"
                    placeholder="User id..."
                    type="text"
                    value={value}
                    onChange={(e) => setValue(e.target.value)}
                />

                <button
                    onClick={(e) => {handleSubmit(e); loopUsers(); }}>Search
                </button>
           </form>

        </div>
        <div className="home">
        <table>
            <thead>
            <tr>
                <th>Id</th>
            <th>First name</th>
            <th>Last name</th>
    <th>Phone number</th>
    <th>Email</th>
    <th>Register date</th>
    <th>Social security</th>

</tr>
</thead>
    <tbody>
    {isEmpty ? (<tr/>) : loopedUsers.map((user) => {
        return(<Link to={`/users/${user.id}`}><tr>
            <td>{user.id}</td>
            <td>{user.first_name}</td>
            <td>{user.last_name}</td>
            <td>{user.phone_number}</td>
            <td>{user.email}</td>
            <td>{user.register_date}</td>
            <td>{user.social_security}</td>
        </tr></Link>)
    })}


</tbody>
</table>
        </div>
        </div>
    );
}
