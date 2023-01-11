import React, {useState} from 'react';
import "../css/UserForm.css";



export const UserForm = ({...props}) => {

    const [filterId, setFilterId] = useState(0);
    const [filterFirstName, setFilterFirstName] = useState("");
    const [filterLastName, setFilterLastName] = useState("");

    const handleSubmit = (event: React.MouseEvent<HTMLButtonElement>) => {
        event.preventDefault();
        props.setUserId(filterId);
        props.setFirstName(filterFirstName);
        props.setLastName(filterLastName);
        props.setHasSearched(true);
        setFilterId(0);
        setFilterFirstName("");
        setFilterLastName("");
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
                        value={!filterId ? "" : filterId}
                        onChange={(e) => setFilterId(+e.target.value)}
                    />
                        </div>
                        <div className="user-form-input">
                    <label>First name</label>
                    <input
                        id="f_firstName"
                        placeholder="First name..."
                        type="text"
                        value={filterFirstName}
                        onChange={(e) => setFilterFirstName(e.target.value)}
                    />
                        </div>
                        <div className="user-form-input">
                    <label>Last name</label>
                    <input
                        id="f_lastName"
                        placeholder="Last name..."
                        type="text"
                        value={filterLastName}
                        onChange={(e) => setFilterLastName(e.target.value)}
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
