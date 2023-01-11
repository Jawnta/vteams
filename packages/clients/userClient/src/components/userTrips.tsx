import React, {useState, useEffect} from 'react';
import TripTable from './tables/tripTable';
function UserTrips({...props}) {
    
    const [trips, setTrips] = useState([]);
    useEffect(() => {
        const userId = props.userData.id
        const getTrips = async () => {
            const response = await fetch(`/users/${userId}/trips`);
            setTrips(await response.json());
        };
        getTrips()
    }, []);

    return(
        <div>
            <h1>Resor</h1>
            <TripTable trips={trips}/>
        </div>
        
    )
}

export default UserTrips;