import React from 'react';
import "../css/UserForm.css";



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
            <div className="user-form">
                <form>
                    <div className="user-form-input-wrapper">
                        <div className="user-form-input">
                    <label>User id</label>
                    <input
                        id="f_userId"
                        placeholder="User id..."
                        type="text"
                        value={props.userId}
                        onChange={(e) => filters['userId'] = +e.target.value}
                    />
                        </div>
                        <div className="user-form-input">
                    <label>First name</label>
                    <input
                        id="f_firstName"
                        placeholder="First name..."
                        type="text"
                        value={props.firstName}
                        onChange={(e) => filters['firstName'] = e.target.value}
                    />
                        </div>
                        <div className="user-form-input">
                    <label>Last name</label>
                    <input
                        id="f_lastName"
                        placeholder="Last name..."
                        type="text"
                        value={props.lastName}
                        onChange={(e) => filters['lastName'] = e.target.value}
                    />
                    </div>
                    </div>

                    <div className="user-form-button">
                    <button
                        onClick={(e) => {handleSubmit(e);}}>Search
                    </button>
                    </div>
                </form>

            </div>
    );
}
