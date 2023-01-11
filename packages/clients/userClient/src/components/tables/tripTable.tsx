import Trip from "../../interfaces/trip";

function TripTable({...props}) {

    if(props.trips){
        return(
            <table className="tripTable">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Scooter id</th>
                        <th>Start</th>
                        <th>Stop</th>
                    
                    </tr>
                </thead>
                <tbody>
                {
                    props.trips.map((trip: Trip) => {
                      return(
                            <tr key={trip.id} className="tripTable-row">
                               <td>{trip.id}</td>
                               <td>{trip.scooter_id}</td>
                               <td>{trip.start_time}</td>
                               <td>{trip.stop_time}</td>
                            </tr>
                          )
                    })
                }
                </tbody>
            </table>
        )
    }
    return (
        <div>
            <p>Loading...</p>
        </div>
    )
}

export default TripTable;