import React, {useState, useEffect} from 'react';
import TripTable from './tables/tripTable';
function UserTrips({...props}) {
    
    const [trips, setTrips] = useState([]);
    useEffect(() => {
        const userId = props.userData.id
        const getTrips = async () => {
            const response = await fetch(`http://localhost:8080/users/${userId}/trips`);
            setTrips(await response.json());
        };
        getTrips()
    }, []);

    return(
        <div className="centerTable">
            <div>
                <h1>Resor</h1>
                <TripTable trips={trips}/>
            </div>
        </div>
        
    )
}

export default UserTrips;