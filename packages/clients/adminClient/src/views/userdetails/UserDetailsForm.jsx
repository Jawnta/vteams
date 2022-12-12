import React from 'react';
import "../css/UserDetailsForm.css";
import {updateUser} from "../../endpoints/UserDetailsEndpoints";



export const UserDetailsForm = ({...props}) => {



    const updateUserDetails = async (user) => {
        const data = {
            userId: user.id,
            user: user
        }

        await updateUser(data);
    };
    const handleSubmit = async (event) => {
        event.preventDefault();


    };



    const updateState = (key, value) => {

        props.setUser({ ...props.user, [key]: value })
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
                    value={props.user.id}
                    onChange={e => updateState("id", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>First name</label>
                <input
                    id="f_firstName"
                    placeholder="First name..."
                    type="text"
                    value={props.user.first_name}
                    onChange={e => updateState("first_name", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Last name</label>
                <input
                    id="f_lastName"
                    placeholder="Last name..."
                    type="text"
                    value={props.user.last_name}
                    onChange={e => updateState("last_name", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Phone number</label>
                <input
                    id="f_phoneNumber"
                    placeholder="Phone number..."
                    type="text"
                    value={props.user.phone_number}
                    onChange={e => updateState("phone_number", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Email</label>
                <input
                    id="f_email"
                    placeholder="Email..."
                    type="text"
                    value={props.user.email}
                    onChange={e => updateState("email", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Register date</label>
                <input
                    id="f_registerDate"
                    placeholder="Register date..."
                    type="text"
                    value={props.user.register_date}
                    onChange={e => updateState("register_date", e.target.value)}
                />
                </div>
                    <div className="user-details-input">
                <label>Social security number</label>
                <input
                    id="f_socialSecurity"
                    placeholder="Social security number..."
                    type="text"
                    value={props.user.social_security}
                    onChange={e => updateState("social_security", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Active</label>
                <input
                    id="f_active"
                    placeholder="Last name..."
                    type="text"
                    value={props.user.active ? "No" : "Yes"}
                    onChange={e => updateState("active", e.target.value)}
                />
                </div>
                <div className="user-details-input">
                <label>Balance</label>
                <input
                    id="f_credit"
                    placeholder="Balance..."
                    type="text"
                    value={props.user.credit}
                    onChange={e => updateState("credit", e.target.value)}
                />
                </div>
                </div>

                <div className="user-details-button">
                <button
                    onClick={async (e) => {await handleSubmit(e); await updateUserDetails(props.user);}}>Update customer
                </button>
                </div>
            </form>

        </div>
    );
}
