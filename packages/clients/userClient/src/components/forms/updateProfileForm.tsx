import React, {useState, useEffect} from 'react'
import User from '../../interfaces/user';
import "../../css/UpdateProfileForm.css";

function UpdateProfileForm({...props}) {

    const [tempUser, setTempUser] = useState<User>(props.user);
    useEffect(() => {
        setTempUser(props.user)
    }, []);
    const updateState = (key: string, value: any) => {
        setTempUser({ ...tempUser, [key]: value })
    }
    const handleSubmit = (event: React.MouseEvent) => {
        event.preventDefault();
      };

    async function updateUserDetails(user:User) {
        const requestOptions = {
            method: "PUT",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(user),
        };
        try{
            const response = await fetch(`http://localhost:8080/users/${user.id}`, requestOptions);
            setTempUser(user)
        } catch (error) {
            console.error(error);
          }


    }
    if(props.user){
        return (
            <div className="user-form">
            <form >
                <div className="user-form-input-wrapper">
                <div className="user-form-input">
                <label>Förnamn:</label>

                    <input 
                        type="text" 
                        name="username" 
                        value={tempUser.first_name || ""}
                        onChange={e => updateState("first_name", e.target.value)}
                    />


            </div>
                <div className="user-form-input">
                <label>Efternamn:</label>
                <input 
                        type="text" 
                        name="surname" 
                        value={tempUser.last_name || ""} 
                        onChange={e => updateState("last_name", e.target.value)}
                    />

                </div>

                <div className="user-form-input">
                <label>Telefon:</label>
                <input 
                        type="tel" 
                        name="phone" 
                        value={tempUser.phone_number || ""} 
                        onChange={e => updateState("phone_number", e.target.value)}
                    />

                </div>
                    <div className="user-form-input">
                <label>Email:</label>
                <input 
                        type="text" 
                        name="email" 
                        value={tempUser.email || ""}
                        onChange={e => updateState("email", e.target.value)} 
                    />

                    </div>
                </div>
                <div className="user-form-button">
                <button
                    onClick={async (e) => {
                    handleSubmit(e);
                    await updateUserDetails(tempUser);
                    }}>Uppdatera profil
                </button>
                </div>
            </form>
            </div>
            
        );
    }
    return (
        <div>
            <p>Loading...</p>
        </div>
    )
    
}

export default UpdateProfileForm;