import Trip from "../../interfaces/trip";
import Invoice from "../../interfaces/invoice";
import '../../css/UserInvoices.css';
import dayjs from "dayjs";

function TripTable({...props}) {
    const fillTripTable = () => {

        return props.trips.map((trip: Trip, index: number) => {
            return(
                //         onClick={() => {
                //         navigateUserDetails(
                //             invoice.id,
                //             invoice.billed,
                //             invoice.trip_id,
                //             invoice.amount,
                //             invoice.payed
                //         )}
                // }
                <tr key={index} >
                        <td>{trip.id}</td>
                        <td>{trip.scooter_id}</td>
                        <td>{trip.start_time}</td>
                        <td>{trip.stop_time}</td>
                </tr>

            )
        })
    };
    if(props.trips){

        return (
            <div className="user-invoice-table-wrapper">
                <div className="user-invoice-table">
                    <table>
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Scooter id</th>
                            <th>Start</th>
                            <th>Stop</th>

                        </tr>
                        </thead>
                        <tbody>
                        {fillTripTable()}

                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
    return (
        <div>
            <p>Loading...</p>
        </div>
    )
}

export default TripTable;