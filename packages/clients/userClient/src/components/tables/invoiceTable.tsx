import Invoice from "../../interfaces/invoice";

function InvoiceTable({...props}) {

    if(props.invoices){
        return(
            <table className="invoiceTable">
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
                {
                    props.invoices.map((invoice: Invoice) => {
                      return(
                            <tr key={invoice.id} className="invoiceTable-row">
                               <td>{invoice.id}</td>
                               <td>{invoice.trip_id}</td>
                               <td>{invoice.payed}</td>
                               <td>{invoice.amount}</td>
                               <td>{invoice.billed}</td>
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

export default InvoiceTable;