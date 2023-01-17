import dayjs from "dayjs";
import '../../css/UserInvoices.css';
import Invoice from "../../interfaces/invoice";
function InvoiceTable({...props}) {

    const fillInvoiceTable = () => {

        return props.invoices.map((invoice: Invoice, index: number) => {
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
                    <td>{invoice.id}</td>
                    <td>{invoice.trip_id}</td>
                    <td>{invoice.payed}</td>
                    <td>{invoice.amount}</td>
                    <td>{dayjs(invoice.billed).format("YYYY-MM-DD").toString()}</td>

                </tr>
            )
        })
    };

    if(props.invoices){

        return (
            <div className="user-invoice-table-wrapper">
                <div className="user-invoice-table">
                    <table>
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Resans id</th>
                            <th>Betald</th>
                            <th>Summa</th>
                            <th>Fakturerad</th>

                        </tr>
                        </thead>
                        <tbody>
                        {fillInvoiceTable()}

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

export default InvoiceTable;