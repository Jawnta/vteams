import React from 'react';
import "../css/Home.css";



export const UserForm = ({...props}) => {

    let filters = {
        userId: 0,
        firstName: "",
        lastName: "",
        phoneNumber: null,

    };

    const handleSubmit = (event) => {
        event.preventDefault();
        props.setUserId(filters.userId);
        props.setFirstName(filters.firstName);
        props.setLastName(filters.lastName);
        props.setHasSearched(true);

    };


    return (
            <div className="home-form">
                <form>
                    <label>User id</label>
                    <input
                        id="f_userId"
                        placeholder="User id..."
                        type="text"
                        value={props.userId}
                        onChange={(e) => filters['userId'] = +e.target.value}
                    />
                    <label>First name</label>
                    <input
                        id="f_firstName"
                        placeholder="First name..."
                        type="text"
                        value={props.firstName}
                        onChange={(e) => filters['firstName'] = e.target.value}
                    />
                    <label>Last name</label>
                    <input
                        id="f_lastName"
                        placeholder="Last name..."
                        type="text"
                        value={props.lastName}
                        onChange={(e) => filters['lastName'] = e.target.value}
                    />

                    <button
                        onClick={(e) => {handleSubmit(e);}}>Search
                    </button>
                </form>

            </div>
    );
}
