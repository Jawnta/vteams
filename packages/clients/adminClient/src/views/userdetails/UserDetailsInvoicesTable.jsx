import React from 'react';
import "../css/UserTable.css";
import { useNavigate } from 'react-router-dom'


export const UserDetailsInvoicesTable = ({...props}) => {

    let invoice = {};
    const navigate = useNavigate();
    const navigateUserDetails = (id, billed, trip_id, amount, payed) =>{
        invoice = {
            id: id,
            billed: billed,
            trip_id: trip_id,
            amount: amount,
            payed: payed

        };
        navigate('/invoiceDetails',{state: {invoice: invoice, user: props.user}});
    };



    const updateInvoiceTable = () => {

        return props.invoices.map((invoice, index) => {
            return(
                <tr key={index} onClick={() => {
                    navigateUserDetails(
                        invoice.id,
                        invoice.billed,
                        invoice.trip_id,
                        invoice.amount,
                        invoice.payed
                    )}
                }>
                    <td>{invoice.id}</td>
                    <td>{invoice.billed}</td>
                    <td>{invoice.trip_id}</td>
                    <td>{invoice.amount}</td>
                    <td>{invoice.payed}</td>

                </tr>
            )
        })
    };




    return (
        <div className="user-table-wrapper">
            <div className="user-table">
                <table>
                    <thead>
                    <tr>
                        <th>Id</th>
                        <th>Billed</th>
                        <th>Trip id</th>
                        <th>Amount</th>
                        <th>Payed</th>

                    </tr>
                    </thead>
                    <tbody>
                    {updateInvoiceTable()}

                    </tbody>
                </table>
            </div>
        </div>
    );
}