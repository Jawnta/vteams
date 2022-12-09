import React, {useState} from 'react';
import "../css/Home.css";



export const UserForm = ({...props}) => {
    const [userId, setUserId] = useState('')


    const handleSubmit = (event) => {
        event.preventDefault();
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
                        value={userId}
                        onChange={(e) => setUserId(e.target.value)}
                    />

                    <button
                        onClick={(e) => {handleSubmit(e);}}>Search
                    </button>
                </form>

            </div>
    );
}
