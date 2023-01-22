import React from 'react';
import "../css/UserTable.css";
import { useNavigate } from 'react-router-dom'
import dayjs from "dayjs";
import {InvoiceInterface} from "../../components/interfaces/invoiceInterface";


export const UserDetailsInvoicesTable = ({...props}) => {

    let invoice = {};
    const navigate = useNavigate();
    const navigateUserDetails = (id: number, billed: Date, trip_id: number, amount: number, payed: Date, fee: number) =>{
        invoice = {
            id: id,
            billed: billed,
            trip_id: trip_id,
            amount: amount,
            payed: payed,
            fee: fee

        };
        navigate('/invoiceDetails',{state: {invoice: invoice, user: props.user}});
    };



    const updateInvoiceTable = () => {

        return props.invoices.map((invoice: InvoiceInterface, index: number) => {
            return(
                <tr key={index} onClick={() => {
                    navigateUserDetails(
                        invoice.id,
                        invoice.billed,
                        invoice.trip_id,
                        invoice.amount,
                        invoice.payed,
                        invoice.fee
                    )}
                }>
                    <td>{invoice.id}</td>
                    <td>{dayjs(invoice.billed).format("YYYY-MM-DD").toString()}</td>
                    <td>{invoice.trip_id}</td>
                    <td>{invoice.amount}</td>
                    <td>{dayjs(invoice.payed).format("YYYY-MM-DD").toString()}</td>

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