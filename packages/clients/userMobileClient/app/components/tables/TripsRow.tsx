import TripsInterface from '../../interfaces/Trips';
import { Row } from 'react-native-table-component';
export function TripsTableRow(tripObj: {trip: TripsInterface}){
    const trip: TripsInterface = tripObj.trip
    return(
        <Row data={[trip.scooter_id, trip.distance, trip.start_time, trip.stop_time]} flexArr={[1, 1, 1,]}/>
    )
}
