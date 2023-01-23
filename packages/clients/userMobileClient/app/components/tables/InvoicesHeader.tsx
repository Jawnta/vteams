import { Row } from 'react-native-table-component';
export function InvoicesTableHeader(){
    const tableHead = ['Faktura', 'Resans id', 'Betald', 'Summa', 'Datum'];
    return(
        <Row data={tableHead} flexArr={[1, 1,]}/>
    )
}