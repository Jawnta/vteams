import InvoicesInterface from '../../interfaces/Invoices';
import { Row } from 'react-native-table-component';
export function InvoicesTableRow(invoiceObj: {invoice: InvoicesInterface}){
    const invoice: InvoicesInterface = invoiceObj.invoice
    return(
        <Row data={[invoice.id, invoice.trip_id, invoice.payed, invoice.amount, invoice.billed]} flexArr={[1, 1, 1,]}/>
    )
}
