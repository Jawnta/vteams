import React from 'react';
import "../css/UserDetailsForm.css";
import {updateUser} from "../../endpoints/UserDetailsEndpoints";
import { useOutletContext } from "react-router-dom";



export const UserDetailsForm = () => {
    const [user, setUser] = useOutletContext();


    const updateUserDetails = async (user) => {

        await updateUser(user);
    };
    const handleSubmit = async (event) => {
        event.preventDefault();


    };



    const updateState = (key, value) => {

        setUser({ ...user, [key]: value })
    }


    return (
        <div className="user-details-form">
            <form>
                <div className="user-details-input-wrapper">
                <div className="user-details-input">
                <label>User id</label>
                <input
                    id="f_userId"
                    placeholder="User id..."
                    type="text"
                    value={user.id}
                    onChange={e => updateState("id", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>First name</label>
                <input
                    id="f_firstName"
                    placeholder="First name..."
                    type="text"
                    value={user.first_name}
                    onChange={e => updateState("first_name", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Last name</label>
                <input
                    id="f_lastName"
                    placeholder="Last name..."
                    type="text"
                    value={user.last_name}
                    onChange={e => updateState("last_name", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Phone number</label>
                <input
                    id="f_phoneNumber"
                    placeholder="Phone number..."
                    type="text"
                    value={user.phone_number}
                    onChange={e => updateState("phone_number", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Email</label>
                <input
                    id="f_email"
                    placeholder="Email..."
                    type="text"
                    value={user.email}
                    onChange={e => updateState("email", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Register date</label>
                <input
                    id="f_registerDate"
                    placeholder="Register date..."
                    type="text"
                    value={user.register_date}
                    onChange={e => updateState("register_date", e.target.value)}
                />
                </div>
                    <div className="user-details-input">
                <label>Social security number</label>
                <input
                    id="f_socialSecurity"
                    placeholder="Social security number..."
                    type="text"
                    value={user.social_security}
                    onChange={e => updateState("social_security", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Active</label>
                <input
                    id="f_active"
                    placeholder="Last name..."
                    type="text"
                    value={user.active ? "No" : "Yes"}
                    onChange={e => updateState("active", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Balance</label>
                <input
                    id="f_credit"
                    placeholder="Balance..."
                    type="text"
                    value={user.credit}
                    onChange={e => updateState("credit", e.target.value)}
                />
                </div>
                </div>

                <div className="user-details-button">
                <button
                    onClick={async (e) => {await handleSubmit(e); await updateUserDetails(user);}}>Update customer
                </button>
                </div>
            </form>

        </div>
    );
}
