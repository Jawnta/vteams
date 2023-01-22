import { Row } from 'react-native-table-component';
export function TripsTableHeader(){
    const tableHead = ['scooter', 'Avstånd', 'Start', 'Stopp'];
    return(
        <Row data={tableHead} flexArr={[1, 1, 1]}/>
    )
}