import React, {useState, useEffect} from 'react'
import User from '../../interfaces/user';

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
            <form >
                <label>Förnamn:
                    <input 
                        type="text" 
                        name="username" 
                        value={tempUser.first_name || ""}
                        onChange={e => updateState("first_name", e.target.value)}
                    />
                </label>
                <label>Efternamn:
                <input 
                        type="text" 
                        name="surname" 
                        value={tempUser.last_name || ""} 
                        onChange={e => updateState("last_name", e.target.value)}
                    />
                </label>
                <label>Telfon:
                <input 
                        type="tel" 
                        name="phone" 
                        value={tempUser.phone_number || ""} 
                        onChange={e => updateState("phone_number", e.target.value)}
                    />
                </label>
                <label>Email:
                <input 
                        type="text" 
                        name="email" 
                        value={tempUser.email || ""}
                        onChange={e => updateState("email", e.target.value)} 
                    />
                </label>
                <button
                    onClick={async (e) => {
                    handleSubmit(e);
                    await updateUserDetails(tempUser);
                    }}>Uppdatera profil
                </button>
            </form>
            
        );
    }
    return (
        <div>
            <p>Loading...</p>
        </div>
    )
    
}

export default UpdateProfileForm;