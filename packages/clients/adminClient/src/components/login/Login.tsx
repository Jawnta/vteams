import React, { useState } from 'react';
import PropTypes from 'prop-types';
import '../css/Login.css';

const loginUser = async (credentials: { username: undefined | string; password: undefined | string; }) => {
    return fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(credentials)
    })
        .then(data => data.json())
}

// @ts-ignore
export const Login = ({ setToken }) => {
    const [username, setUserName] = useState();
    const [password, setPassword] = useState();

    const handleSubmit = async (e: Event) => {
        e.preventDefault();
        const token = await loginUser({
            username,
            password
        });
        setToken(token.token);
        localStorage.setItem("token", token.token);

    }

    return(
        <div className="login-wrapper">
            <div className="login">
            <form
                //@ts-ignore
                onSubmit={handleSubmit}>
                <label>
                    <p>Username</p>

                    <input type="text"
                            //@ts-ignore
                           onChange={e => setUserName(e.target.value)} />
                </label>
                <label>
                    <p>Password</p>
                    <input type="password"
                            //@ts-ignore
                           onChange={e => setPassword(e.target.value)} />
                </label>
                <div>
                    <button className="login-button" type="submit">Login</button>
                </div>
            </form>
        </div>
        </div>
    )
}

Login.propTypes = {
    setToken: PropTypes.func.isRequired
};
